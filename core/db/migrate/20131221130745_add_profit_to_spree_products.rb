class AddProfitToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :profit, :float
  end
end
