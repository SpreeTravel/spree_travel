module Spree
  module TemporalDynamicAttribute

    include DynamicAttribute

    def set_temporal_option_values(params)
      option_types_and_values_from_params(params).each do |key, value|
        #Log.debug("#{key} => #{value}")
        set_temporal_option_value(key, value)
      end
      #Log.debug("TEMPORAL: " + @temporal.inspect)
    end

    def set_temporal_option_value(option_type, value)
      @temporal[option_type.to_s] = value
    end

    def get_temporal_option_value(option_type)
      @temporal[option_type.to_s]
    end

  end
end
