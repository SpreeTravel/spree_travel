module Spree
  Prototype.class_eval do    
    belongs_to :product_type, :class_name => 'Spree::ProductType', :foreign_key => 'product_type_id'
  end
end
