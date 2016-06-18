FactoryGirl.define do
  factory :travel_variant, class: Spree::Variant do
    sequence(:sku, 'a'){ |n| "travel_variant_#{n}" }
    product { |p| p.association(:travel_product) }
  end
end