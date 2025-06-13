class ShoppingList < ApplicationRecord
  belongs_to :recipe
  belongs_to :inventory
  belongs_to :user
  has_many :shopping_list_items, dependent: :destroy
end
