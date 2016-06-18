FactoryGirl.define do
  factory :rate_hotel, class: Spree::Rate do
    ignore do
      start_date Date.today - (365 / 2)
      end_date Date.today + (365 / 2)
      plan Spree::OptionValue.where(name: "plan-all-inclusive").first
      simple '20'
      double '40'
      triple '60'
      first_child '10'
      second_child '20'
    end
    association :variant, factory: :variant_decorated
    after(:create) { |rate, evaluator|
      rate.set_persisted_option_value(:start_date, evaluator.start_date)
      rate.set_persisted_option_value(:end_date, evaluator.end_date)
      rate.set_persisted_option_value(:plan, evaluator.plan.id)
      rate.set_persisted_option_value(:simple, evaluator.simple)
      rate.set_persisted_option_value(:double, evaluator.double)
      rate.set_persisted_option_value(:triple, evaluator.triple)
      rate.set_persisted_option_value(:first_child, evaluator.first_child)
      rate.set_persisted_option_value(:second_child, evaluator.second_child)
      rate.save
    }
  end
end