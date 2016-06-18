require 'spec_helper'

describe Spree::OptionType do

  it 'haves a valid default factory' do
    expect(build(:option_type_decorated)).to be_valid
  end

  it 'haves a valid selection_type factory' do
    expect(build(:selection_option_type)).to be_valid
  end

  it 'haves a valid date_type factory' do
    expect(build(:date_option_type)).to be_valid
  end

  it 'haves a valid integer_type factory' do
    expect(build(:integer_option_type)).to be_valid
  end

  it 'haves a valid float_type factory' do
    expect(build(:float_option_type)).to be_valid
  end

  it 'does no allow duplicate names' do
    opt_type = create(:option_type_decorated)
    expect(build(:option_type, name: opt_type.name)).not_to be_valid
  end

  it 'validates correct format of name' do
    expect(build(:option_type_decorated, name: "puplic@")).not_to be_valid
    expect(build(:option_type_decorated, name: "Puplic")).not_to be_valid
  end

  it 'creates a default option_value if it is not of type selection' do
    opt_type = create(:date_option_type)
    expect(opt_type.option_values.count).to be_equal(1)
  end
end