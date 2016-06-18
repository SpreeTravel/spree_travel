module Spree
  LineItem.class_eval do
    has_many :paxes, :class_name => "Spree::Pax", :dependent => :destroy
    belongs_to :context, :class_name => "Spree::Context"
    belongs_to :rate, class_name: "Spree::Rate"

    accepts_nested_attributes_for :paxes


    def copy_price
      if variant
        if variant.product.product_type
          # TODO take into account here the currency change, i am not taking it now
          # TODO this has to be improved, regarding the comparinson with the rate.
          variant.product.calculate_price(context, variant, temporal:false).each do |s|
            if self.rate.id == s[:rate]
              self.price = s[:price]
            end
          end
          # self.price = variant.product.calculate_price(context, variant, temporal:false).first[:price]
          self.cost_price =  variant.cost_price if cost_price.nil?
          self.currency =  variant.currency if currency.nil?
        else
          self.price = variant.price if price.nil?
          self.cost_price = variant.cost_price if cost_price.nil?
          self.currency = variant.currency if currency.nil?
        end
      end
    end

  end
end
