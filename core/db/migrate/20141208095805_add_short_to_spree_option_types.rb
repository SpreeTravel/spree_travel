class AddShortToSpreeOptionTypes < ActiveRecord::Migration
  def change
    add_column :spree_option_types, :short, :string
  end
end
