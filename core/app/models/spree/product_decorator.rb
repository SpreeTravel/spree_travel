Spree::Product.class_eval do
    require 'ffaker'

    belongs_to :product_type
    belongs_to :travel_calculator, :class_name => 'Spree::TravelCalculator', :foreign_key => 'calculator_id'
    has_many :rates, :through => :variants_including_master

    after_create :absorb_option_types

    def absorb_option_types
      Log.debug("absorbing option types")
      self.option_types = self.product_type.variant_option_types
    rescue Exception => ex
      Log.exception(ex)
    end

    def calculator_instance
      calculator.name.constantize.new
    end

    def calculate_price(context, variant, options)
      # calculator_instance.calculate_price(context, self, options).sort
      calculator_instance.calculate_price(context, self, variant, options)
    end

    def self.calculator_instance_for(product_type)
      product_type.calculator.name.constantize.new
    end

    def generate_variants
      variations.each do |array|
        variant = Spree::Variant.new
        variant.sku = Faker.bothify('???-######').upcase
        variant.price = 0
        variant.product_id = self.id
        variant.calculator = self.product_type.calculator
        variant.save
        string = "PRODUCT:".red + " #{self.name}: "
        for ov in array
          opt_name = ov.option_type.name
          opt_value = ov.name
          string += "#{opt_name.upcase.green}: #{opt_value}, "
          variant.set_option_value(opt_name, opt_value)
        end
        Log.debug(string)
        variant.save
      end
    end

    def rate_option_types
      self.product_type.rate_option_types
    end

    def context_option_types
      self.product_type.context_option_types
    end

    def destination_taxon
      destination_taxonomy = Spree::Taxonomy.where(:name => 'Destination').first
      self.taxons.where(:taxonomy_id => destination_taxonomy.id).first
    rescue
      nil
    end

    def destination
      destination_taxon.name rescue "no place"
    end

    # TODO: poner bonito la seleccion de variantes en la creacion de
    # productos, parece que es de Spree

    def variations
      the_array = []
      recursive_variations(self.option_types, the_array)
      the_array
    end

    def recursive_variations(the_option_types, the_big_array, index = 0, array = [])
      if the_option_types.length == index
        the_big_array << array.clone
      else
        for option_value in the_option_types[index].option_values
          array[index] = option_value
          recursive_variations(the_option_types, the_big_array, index + 1, array)
        end
      end
    end


    # def self.with_price(context)
    #   product_type = Spree::ProductType.find_by_name(context.product_type)
    #   string = calculator_instance_for(product_type).combination_string_for_search(context) if product_type
    #   list = Spree::Product.where('1 > 0')
    #   list = list.where(:product_type_id => product_type.id) if product_type
    #   list = list.joins(:combinations)
    #   list = list.where('spree_combinations.start_date <= ?', context.start_date) if context.start_date.present?
    #   list = list.where('spree_combinations.end_date >= ?', context.end_date) if context.end_date.present?
    #   list = list.where('spree_combinations.adults' => context.adult) if context.adult.present?
    #   list = list.where('spree_combinations.children' => context.child) if context.child.present?
    #   list = list.where('spree_combinations.other like ?', string) if product_type && string
    #   list = list.uniq
    #   list
    # end



  end