require 'spec_helper'

describe Spree::Admin::RatesController do

  it 'loads correctly the product' do
    prod_type = create(:product_type_with_variant_option_types)
    prod = create(:travel_product, product_type: prod_type)
    params = {}
    params[:product_id] = prod.id
    spree_get :index
    expect(assigns(:product)).to eq product
  end

end
