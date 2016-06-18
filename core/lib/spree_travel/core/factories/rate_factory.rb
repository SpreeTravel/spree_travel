FactoryGirl.define do
  factory :rate, class: Spree::Rate do
    variant { |v| v.association(:travel_variant) }
  end
end