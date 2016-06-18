module Spree
  class ProductType < ActiveRecord::Base

    has_and_belongs_to_many :rate_option_types,
      :join_table => :spree_product_type_rate_option_types,
      :class_name => 'Spree::OptionType',
      :foreign_key => 'product_type_id',
      :association_foreign_key => 'rate_option_type_id'
    has_and_belongs_to_many :context_option_types,
      :join_table => :spree_product_type_context_option_types,
      :class_name => 'Spree::OptionType',
      :foreign_key => 'product_type_id',
      :association_foreign_key => 'context_option_type_id'
    has_and_belongs_to_many :variant_option_types,
      :join_table => :spree_product_type_variant_option_types,
      :class_name => 'Spree::OptionType',
      :foreign_key => 'product_type_id',
      :association_foreign_key => 'variant_option_type_id'
    has_one :calculator,
      :class_name => 'Spree::TravelCalculator',
      :foreign_key => 'product_type_id'

    validates_presence_of :name, :presentation
    validates_uniqueness_of :name


    def search_box_option_types(params = nil)

      if params && params[:controller] == 'spree/products' && params[:action] == 'show'
        (context_option_types).uniq
      else
        (context_option_types).uniq
      end


    end

    # # Original enabled definition, holds the semantic interpretation
    # def self.enabled
    #   where(:enabled => true).where.not(:name => "Product")
    # end

    # Modified enabled definition, to exclude product product_type, for lacking of relevance
    def self.enabled
      where(:enabled => true)#.where.not(:name => "Product")
    end

  end
end
