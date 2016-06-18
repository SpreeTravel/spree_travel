class AddContextToLineItem < ActiveRecord::Migration
  def change
    add_column :spree_line_items, :context_id, :integer
  end
end
