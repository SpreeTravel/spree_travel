module Spree
  module BaseHelper

      def hotel_stars(product)
        5
        #product.product_properties.where(:property_id => Spree::Property.find_by_name('estrellas')).first.value
      end

  end
end
