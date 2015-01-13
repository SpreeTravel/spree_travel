require 'spec_helper'

describe 'load' do

  context 'inserts correctly' do
    it 'the calculator' do
      expect(Spree::TravelCalculator.where(:name => 'Spree::CalculatorHotel').first.product_type.name).to eq('hotel')
    end

    it 'the option types' do
      expect(Spree::OptionType.where(:name => 'start_date').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'end_date').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'plan').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'adult').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'child').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'room').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'simple').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'double').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'triple').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'first_child').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'second_child').count).to be_equal(1)
    end

    it 'the option values' do
      expect(Spree::OptionValue.where(:name => 'room-standard').count).to be_equal(1)
      expect(Spree::OptionValue.where(:name => 'room-suite').count).to be_equal(1)
      expect(Spree::OptionValue.where(:name => 'room-junior-suite').count).to be_equal(1)
      expect(Spree::OptionValue.where(:name => 'room-master-suite').count).to be_equal(1)
      expect(Spree::OptionValue.where(:name => 'plan-continental-breakfast').count).to be_equal(1)
      expect(Spree::OptionValue.where(:name => 'plan-modified-american-plan').count).to be_equal(1)
      expect(Spree::OptionValue.where(:name => 'plan-american-plan').count).to be_equal(1)
      expect(Spree::OptionValue.where(:name => 'plan-all-inclusive').count).to be_equal(1)
    end
  end
end