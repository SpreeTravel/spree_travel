FactoryGirl.define do

  factory :hotel_context, class: Spree::Context do
    ignore do
      variant ""
      adults 1
      childs 1
      plan "plan-all-inclusive"
      start_date Date.today + 5
      end_date Date.today + 10
    end
    line_item
    after(:create) { |context, evaluator|
      context_params = {}
      context_params['product_type'] = 'hotel'
      context_params['adult'] = evaluator.adults
      context_params['child'] = evaluator.childs
      context_params['plan'] = evaluator.plan
      context_params['start_date'] = evaluator.start_date
      context_params['end_date'] = evaluator.end_date
      context.initialize_variables
      context.set_option_values(context_params, :temporal => true)
    }
  end

  factory :context_option_value, class: Spree::ContextOptionValue do
    association :option_value, factory: :option_value_decorated
    association :context, factory: :hotel_context
  end

end

