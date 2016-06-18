module Spree
  class TravelCalculator < ActiveRecord::Base
    belongs_to :product_type, :class_name => 'Spree::ProductType', :foreign_key => 'product_type_id'
  end
end
