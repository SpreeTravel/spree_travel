class CreateSpreeProductTypeVariantOptionTypes < ActiveRecord::Migration
  def change
    create_table :spree_product_type_variant_option_types, :index => false do |t|
      t.integer :variant_option_type_id
      t.integer :product_type_id
    end
  end
end
