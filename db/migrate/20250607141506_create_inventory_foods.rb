class CreateInventoryFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :inventory_foods do |t|
      t.references :inventory, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
