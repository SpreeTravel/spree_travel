require 'spec_helper'

describe Spree::OptionValue do

  it 'haves a valid default factory' do
    expect(build(:option_value_decorated)).to be_valid
  end

  it 'responds to the position attribute' do
    option_value = create(:option_value_decorated)
    expect(option_value.position).not_to be_nil
  end
end