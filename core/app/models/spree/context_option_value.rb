module Spree
  class ContextOptionValue < ActiveRecord::Base
    belongs_to :context, :class_name => 'Spree::Context', :foreign_key => 'context_id'
    belongs_to :option_value, :class_name => 'Spree::OptionValue', :foreign_key => 'option_value_id'
  end
end
