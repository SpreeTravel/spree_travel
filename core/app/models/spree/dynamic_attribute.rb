module Spree
  module DynamicAttribute

    def option_types_and_values_from_params(params)
      #Log.debug("PARAMS: #{params.inspect}")
      prefix = params["product_type"]
      hash = {}
      if prefix
        product_type = Spree::ProductType.find_by_name(prefix)
        attr_option_types = self.class.to_s.split('::').last.downcase + "_option_types"
        option_types_objects = product_type.send(attr_option_types)
        option_types = option_types_objects.map(&:name)
        #TODO this is a path we have to fix to have the MEALPLAN as part of the context but not in the searcher
        if prefix == 'hotel'
          option_types << 'plan'
        end

      else
        option_types = [:start_date, :end_date, :adult, :child]
      end
      #Log.debug("OPTIONS: #{option_types.inspect}")
      params.each do |key, value|
        name = key
        option_type = option_types.find do |ot|
          name = key[prefix.length+1 .. -1] if prefix && key.index(prefix) == 0
          (name == ot)
        end
        hash[name.to_s] = value if option_type
      end
      hash['product_type'] = prefix
      Log.debug("HASH: #{hash.inspect}")
      hash
    end

    def get_mixed_option_value(option_type, options = {:temporal => true})
      if options[:temporal]
        get_temporal_option_value(option_type)
      else
        get_persisted_option_value(option_type)
      end
    end

  end
end
