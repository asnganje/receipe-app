class AddDescriptionToInventory < ActiveRecord::Migration[8.0]
  def change
    add_column :inventories, :description, :text
  end
end
