class CreateShoppingListItems < ActiveRecord::Migration[8.0]
  def change
    create_table :shopping_list_items do |t|
      t.references :shopping_list, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.integer :needed
      t.decimal :unit_price
      t.decimal :total_value

      t.timestamps
    end
  end
end
