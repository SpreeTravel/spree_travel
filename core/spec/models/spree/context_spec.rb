require 'spec_helper'

describe Spree::Context do

  it 'haves a valid factory' do
    expect(build(:context)).to be_valid
  end

  it 'corresponds with dynamic attribute parent class' do
    prod_type = create(:product_type_with_context_option_types)
    prod = create(:travel_product, product_type: prod_type)
    context_params = params_for_dynamic_attribute(prod)
    context = Spree::Context.build_from_params(context_params, temporal: true)
    expect(context.get_temporal_option_value(prod.context_option_types.first.name)).to be_equal(prod.context_option_types.first.option_values.first.name)
  end

end