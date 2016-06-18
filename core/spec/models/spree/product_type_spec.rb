require 'spec_helper'

describe Spree::ProductType do

  it 'haves a valid factory' do
    expect(build(:product_type)).to be_valid
  end


# TODO 24/10/2014 Check why the have syntax does not work properly
  it 'is not valid without a name' do
    expect(build(:product_type, name: nil)).not_to be_valid
  end

  it 'is not valid without a presentation' do
    expect(build(:product_type, presentation: nil)).not_to be_valid
  end

  it 'does not allow duplicate names' do
    product_type = create(:product_type)
    expect(build(:product_type, name: product_type.name)).not_to be_valid
  end

  it 'associates correctly with other products' do
    base_prod = create(:base_product)
    product_product_type = create(:product_type)
    base_prod.product_type = product_product_type
    expect(base_prod.product_type.name).to be_equal(product_product_type.name)
  end

  it 'responds to its attributes' do
    product_type = create(:product_type)
    expect(product_type).to respond_to(:enabled)
    expect(product_type).to respond_to(:name)
    expect(product_type).to respond_to(:presentation)
  end

  # it 'responds to its associations' do

  # end

end