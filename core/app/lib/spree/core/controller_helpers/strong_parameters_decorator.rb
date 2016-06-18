module Spree
  module Core
    module ControllerHelpers
      module StrongParameters
        self.class_eval do

          def permitted_line_item_attributes
            permitted_attributes.line_item_attributes + [
              :paxes_attributes => [:id, :first_name, :last_name]
            ]
          end

          def permitted_checkout_attributes
            permitted_attributes.checkout_attributes + [
              :bill_address_attributes => permitted_address_attributes,
              # :ship_address_attributes => permitted_address_attributes,
              :payments_attributes => permitted_payment_attributes,
              # :shipments_attributes => permitted_shipment_attributes
              :line_items_attributes => permitted_line_item_attributes
            ]
          end

        end
      end
    end
  end
end