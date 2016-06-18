class AddAttrTypeToSpreeOptionTypes < ActiveRecord::Migration
  def change
    add_column :spree_option_types, :attr_type, :string, :default=>'selection'
  end
end
