class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods
  has_many :shopping_lists, dependent: :destroy
  has_many :foods, through: :inventory_foods
end
