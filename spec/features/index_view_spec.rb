require 'spec_helper'

describe "Spree Home View" do

  before(:each) do
    visit spree.root_path
  end

  it 'haves the button to add to cart on cart_form' do
    within("#cart_form") do
       expect(page).to have_content('Add to Cart')
    end
  end

end