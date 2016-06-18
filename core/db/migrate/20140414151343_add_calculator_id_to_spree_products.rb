class AddCalculatorIdToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :calculator_id, :integer
  end
end
