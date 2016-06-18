class CreateSpreePrototypesTaxons < ActiveRecord::Migration
  def change
    create_table :spree_prototypes_taxons, :index => false do |t|
      t.integer :taxon_id
      t.integer :prototype_id
    end
  end
end
