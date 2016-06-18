class AddCalculatorToVariant < ActiveRecord::Migration
  def change
    add_column :spree_variants, :calculator_id, :integer
  end
end
