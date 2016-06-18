FactoryGirl.define do
  factory :product_type, class: Spree::ProductType do
    sequence(:name) { |n| "product_type_##{n}" }
    sequence(:presentation){ |n| "Product Type ##{n}"}
    enabled true

    factory :product_type_with_variant_option_types do
      after(:create) {|product_type| product_type.variant_option_types = [create(:selection_option_type_with_values)]}
    end

    factory :product_type_with_context_option_types do
      after(:create) {|product_type| product_type.context_option_types = [create(:selection_option_type_with_values)]}
    end

  end
end