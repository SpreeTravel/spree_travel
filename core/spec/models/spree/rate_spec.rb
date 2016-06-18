require 'spec_helper'

describe Spree::Rate do

  it 'haves a valid factory' do
    expect(build(:rate)).to be_valid
  end

  it 'respond to the attributes' do
    rate = create(:rate)
    expect(rate).to respond_to(:start_date)
    expect(rate).to respond_to(:end_date)
    expect(rate).to respond_to(:plan)
    expect(rate).to respond_to(:simple)
    expect(rate).to respond_to(:double)
    expect(rate).to respond_to(:triple)
    expect(rate).to respond_to(:first_child)
    expect(rate).to respond_to(:second_child)
    expect(rate).to respond_to(:one_adult)
    expect(rate).to respond_to(:one_child)
  end

end