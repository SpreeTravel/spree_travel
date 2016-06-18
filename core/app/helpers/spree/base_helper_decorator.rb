Spree::BaseHelper.class_eval do

    # def display_price(product_or_variant)
    #   product_or_variant.price_in(current_currency).display_price.to_html
    # end

    #TODO must take into account the currency, beacuse here i am not having any currency into account
    def display_travel_price(product_or_variant)
      if product_or_variant.class == Spree::Product
        context = Spree::Context.build_from_params(params.merge!(product_type: product_or_variant.product_type.name), :temporal => true)
        product_or_variant.calculate_price(context, product_or_variant.variants.first, :temporal => true )
      elsif product_or_variant.class == Spree::Variant
        puts 'the params...........................'
        puts params.inspect
        context = Spree::Context.build_from_params(params.merge!(product_type: product_or_variant.product.product_type.name), :temporal => true)
        product_or_variant.product.calculate_price(context, product_or_variant, :temporal => true )
      end
    end

    def get_rate_price(rate, adults, children)
      adults = adults.to_i
      children = children.to_i
      adults_hash = {1 => 'simple', 2 => 'double', 3 => 'triple'}
      price = adults * rate.send(adults_hash[adults]).to_f
      price += rate.first_child.to_f if children >= 1
      price += rate.second_child.to_f if children == 2
      price
    end

end
