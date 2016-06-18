FactoryGirl.define do
  factory :option_value_decorated, class: Spree::OptionValue do
    sequence(:name) { |n| "product_type_##{n}" }
    sequence(:presentation) { |n| "Option Value ##{n}" }
    association :option_type, factory: :option_type_decorated
  end
end