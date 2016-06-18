module Spree
  class RateOptionValue < ActiveRecord::Base
    belongs_to :rate, :class_name => 'Spree::Rate', :foreign_key => 'rate_id'
    belongs_to :option_value, :class_name => 'Spree::OptionValue', :foreign_key => 'option_value_id'
  end
end
