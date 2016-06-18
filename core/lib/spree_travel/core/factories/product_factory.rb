FactoryGirl.define do
  factory :travel_product, class: Spree::Product do
    sequence(:name) { |n| "Product ##{n} - #{Kernel.rand(9999)}" }
    price 19.99
    cost_price 17.00
    sku { "ABC-#{Kernel.rand(9999)}" }
    available_on { 1.year.ago }
    deleted_at nil
    shipping_category { |r| Spree::ShippingCategory.first || r.association(:shipping_category) }
    product_type
  end
end