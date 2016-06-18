FactoryGirl.define do
  factory :option_type_decorated, class: Spree::OptionType do
    sequence(:name, 'a'){ |n| "option_type_#{n}" }
    sequence(:presentation, 'a'){|n| "Option Type #{n}"}
    position 0
    attr_type 'selection'

    factory :selection_option_type do
      sequence(:name, 'a'){ |n| "selection_option_type_#{n}" }
      sequence(:presentation, 'a'){|n| "Selection Option Type #{n}"}
      attr_type 'selection'

      factory :selection_option_type_with_values do
        after(:create) {|option_type| option_type.option_values = [create(:option_value_decorated, option_type: option_type)]}
      end
    end

    factory :date_option_type do
      sequence(:name, 'a'){ |n| "date_option_type_#{n}" }
      sequence(:presentation, 'a'){|n| "Date Option Type #{n}"}
      attr_type 'date'
    end

    factory :integer_option_type do
      sequence(:name, 'a'){ |n| "integer_option_type_#{n}" }
      sequence(:presentation, 'a'){|n| "Integer Option Type #{n}"}
      attr_type 'integer'
    end

    factory :float_option_type do
      sequence(:name, 'a'){ |n| "float_option_type_#{n}" }
      sequence(:presentation, 'a'){|n| "Float Option Type #{n}"}
      attr_type 'float'
    end
  end
end