class AddRateToLineItem < ActiveRecord::Migration
  def change
    add_column :spree_line_items, :rate_id, :integer
  end
end
