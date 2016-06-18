require 'spec_helper'

describe Spree::Pax do

  it 'haves a valid default factory' do
    expect(build(:male_pax)).to be_valid
  end

  it 'is not valid without a first name' do
    expect(build(:male_pax, first_name: nil)).not_to be_valid
  end

  it 'is not valid without a last name' do
    expect(build(:male_pax, last_name: nil)).not_to be_valid
  end

  it 'is not valid without a sex' do
    expect(build(:male_pax, sex: nil)).not_to be_valid
  end

  context 'only accept sex values for male and female' do
    it 'accepts paxes with male sex value' do
      expect(build(:male_pax)).to be_valid
    end

    it 'accepts paxes with female sex value' do
      expect(build(:female_pax)).to be_valid
    end

    it 'is not valid without a sex value different from male or female' do
      expect(build(:male_pax, sex: "other")).not_to be_valid
    end
  end
end