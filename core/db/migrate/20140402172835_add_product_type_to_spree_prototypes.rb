class AddProductTypeToSpreePrototypes < ActiveRecord::Migration
  def change
    add_column :spree_prototypes, :product_type_id, :integer
  end
end
