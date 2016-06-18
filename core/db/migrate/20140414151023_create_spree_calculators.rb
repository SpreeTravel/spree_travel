class CreateSpreeCalculators < ActiveRecord::Migration
  def change
    create_table :spree_travel_calculators do |t|
      t.string :name
      t.integer :product_type_id
    end
  end
end
