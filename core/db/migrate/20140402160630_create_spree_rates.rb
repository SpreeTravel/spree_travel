class CreateSpreeRates < ActiveRecord::Migration
  def up
    create_table :spree_rates do |t|
      t.integer :variant_id

      t.timestamps
    end
  end

  def down
    drop_table :spree_rates
  end
end
