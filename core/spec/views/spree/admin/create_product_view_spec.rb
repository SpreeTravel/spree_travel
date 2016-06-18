require 'spec_helper'

describe "Spree Product Create View" do
  context 'as Admin user' do
    #spree helper to enter as admin
    before(:each) do
      user = create(:admin_user, email: 'admin@person.com')
      visit spree.admin_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'secret'
      click_button 'Login'
    end

    it 'haves the fields to add a product type' do
      visit spree.admin_path
      click_link "Products"
      click_link("New Product")
      expect(page).to have_field("product_type")
    end
  end
end
