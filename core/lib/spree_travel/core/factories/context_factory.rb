FactoryGirl.define do

  factory :context, class: Spree::Context do
    after(:create) do |context|
      2.times do
        context.option_values << [create(:context_option_values)]
      end
    end
  end

  factory :context_option_value, class: Spree::ContextOptionValue do
    option_value create(:option_value_decorated)
  end

end