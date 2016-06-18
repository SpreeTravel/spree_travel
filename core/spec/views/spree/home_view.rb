require 'spec_helper'

describe "Spree Home View" do
  context 'as Admin user' do
    #spree helper to enter as admin
    before(:each) do
      visit spree.home_path
    end

    it 'haves the fields to add a product type' do
      within("#{}cart_form") do
         expect(page).to have_content('Add to Cart')
      end
    end
  end
end