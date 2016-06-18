module Spree
  OptionType.class_eval do

    validates_uniqueness_of :name
    validates_format_of :name, with: /\A[a-z_]+\z/, message: "can only contains lowercase letters and '_'"
    after_create :default_option_value

    def default_option_value
      if attr_type != 'selection' && option_values.empty?
        OptionValue.create(
             :name => self.name,
             :presentation => self.presentation,
             :option_type_id => self.id
         )
      end
    end

  end
end
