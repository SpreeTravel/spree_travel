module Spree
  module Core
    module Search
      class Base
        attr_accessor :properties
        attr_accessor :current_user
        attr_accessor :current_currency

        def initialize(params)
          self.current_currency = Spree::Config[:currency]
          @properties = {}
          prepare(params)
        end

        def retrieve_products
          @products = get_base_scope
          curr_page = page || 1

          unless Spree::Config.show_products_without_price
            @products = @products.where("spree_prices.amount IS NOT NULL").where("spree_prices.currency" => current_currency)
          end
          @products = @products.page(curr_page).per(per_page)
        end

        def method_missing(name)
          if @properties.has_key? name
            @properties[name]
          else
            super
          end
        end

        protected

        def get_base_scope
          base_scope = Spree::Product.active
          base_scope = get_product_by_product_type(base_scope)
          base_scope = get_product_by_taxons(base_scope)
          base_scope = get_products_conditions_for(base_scope, keywords)
          base_scope = add_search_scopes(base_scope)
          base_scope = add_eagerload_scopes(base_scope)
         # base_scope = filter_products_by_searcher(base_scope)
          base_scope
        end

        def filter_products_by_searcher(base_scope)
          # TODO  Here we must filter not to show products that does not have Price
          base_scope = base_scope.calculate_price(context, options) if context.present
          base_scope
        end

        def get_product_by_taxons(base_scope)
          #TODO take into account that the destination may be and id
          destination_taxon = Spree::Taxon.find_by_name(destination) unless destination.blank?
          base_scope = base_scope.in_taxon(taxon) unless taxon.blank?
          base_scope = base_scope.in_taxon(destination_taxon) unless destination_taxon.blank?
          base_scope
        end

        def get_product_by_product_type(base_scope)
          base_scope = base_scope.where(:product_type_id => product_type.id) if product_type
          base_scope
        end

        def add_eagerload_scopes(base_scope)
          if include_images
            base_scope.includes({master: [:prices, :images]})
          else
            base_scope.includes(master: :prices)
          end
        end

        def add_search_scopes(base_scope)
          search.each do |name, scope_attribute|
            scope_name = name.to_sym
            if base_scope.respond_to?(:search_scopes) && base_scope.search_scopes.include?(scope_name.to_sym)
              base_scope = base_scope.send(scope_name, *scope_attribute)
            else
              base_scope = base_scope.merge(Spree::Product.ransack({scope_name => scope_attribute}).result)
            end
          end if search
          base_scope
        end

        # method should return new scope based on base_scope
        def get_products_conditions_for(base_scope, query)
          unless query.blank?
            base_scope = base_scope.like_any([:name, :description], query.split)
          end
          base_scope
        end

        def prepare(params)
          @properties[:taxon] = params[:taxon].blank? ? nil : Spree::Taxon.find(params[:taxon])
          @properties[:keywords] = params[:keywords]
          @properties[:search] = params[:search]
          @properties[:include_images] = params[:include_images]
          @properties[:product_type] = product_type = Spree::ProductType.find_by_name(params[:product_type])
          @properties[:destination] = nil # esto hace falta abajo
          @properties[:context] = Context.build_from_params(params, :temporal => true)
          @properties[:options] = []

          #TODO: ver que hay que hacer aqui si esto da null
          product_type.context_option_types.each do |ptcot|
            prefix = params[:product_type]
            short_name = ptcot.name
            large_name = prefix + "_" + short_name
            @properties[short_name.to_sym] = params[large_name]
            #Log.debug("#{short_name} => #{large_name} => #{params[large_name]}")
          end if product_type

          per_page = params[:per_page].to_i
          @properties[:per_page] = per_page > 0 ? per_page : Spree::Config[:products_per_page]
          @properties[:page] = (params[:page].to_i <= 0) ? 1 : params[:page].to_i
          Log.debug("PARAMS: " + params.inspect)
          Log.debug("PROPERTIES: " + @properties.inspect)
        end
      end
    end
  end
end
