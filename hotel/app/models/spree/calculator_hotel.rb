module Spree
  class CalculatorHotel < BaseCalculator

    def adults_range
      (1..3).to_a
    end

    def children_range
      (0..2).to_a
    end

     def calculate_price(context, product, variant, options)
       return [price:product.price.to_f] if product.rates.empty?
      # days = context.end_date(options).to_date - context.start_date(options).to_date rescue 1
      # rooms = context.rooms(options).to_i rescue 1
      adults_hash = {1 => 'simple', 2 => 'double', 3 => 'triple'}

      list = product.variants.where(id: variant.id).first.rates
      array = []
      list.each do |r|
        if Date.parse(r.start_date) <= Date.parse(context.start_date(options).to_s) &&
            Date.parse(r.end_date) >= Date.parse(context.end_date(options).to_s)

          avg_price = r.send(adults_hash[context.adult(options).to_i]).to_f
          price = context.adult(options).to_i * avg_price * context.room_count(options).to_i
          price += r.first_child.to_f if context.child(options).to_i >= 1
          price += r.second_child.to_f if context.child(options).to_i == 2
          # price = price * days * rooms # TODO "x days per room"
          array << {price: price, rate: r.id, avg: avg_price}
        end
      end
      array

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
end
