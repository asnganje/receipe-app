class CreateRecipeFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :recipe_foods do |t|
      t.references :food, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
