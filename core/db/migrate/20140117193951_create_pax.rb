class CreatePax < ActiveRecord::Migration
  def change
    create_table :spree_paxes do |t|
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.date :birth
    end
  end
end
