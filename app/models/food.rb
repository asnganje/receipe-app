class Food < ApplicationRecord
  has_many :shopping_list_items, dependent: :destroy
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods
  has_many :inventory_foods, dependent: :destroy
  has_many :inventories, through: :inventory_foods
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
end
