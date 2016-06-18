module Spree
  module PermittedAttributes
    self.class_eval do

      Spree::PermittedAttributes::ATTRIBUTES << :pax_attributes

      @@pax_attributes = [:id, :first_name, :last_name]

      @@line_item_attributes = [:id, :variant_id, :quantity, :paxes]

    end
  end
end
