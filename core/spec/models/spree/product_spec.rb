require 'spec_helper'

describe Spree::Product do
  it 'associates correctly with product type' do
    travel_prod = build(:travel_product)
    expect(travel_prod).to be_valid
    expect(travel_prod.product_type).not_to be_nil
  end

  it 'creates variants for each product_type variant_option_type' do
    prod_type = create(:product_type_with_variant_option_types)
    prod = create(:travel_product, product_type: prod_type)
    prod.generate_variants
    variant = prod.variants.first
    expect(variant.option_values.first.id).to be_equal(prod.option_types.first.option_values.first.id)
  end
end