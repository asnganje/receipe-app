class ShoppingListController < ApplicationController
  before_action :authenticate_user!
  layout "admin"

  def index
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @inventories = current_user.inventories
    @shopping_list = ShoppingList.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])

    shopping_list = current_user.shopping_lists.create!(recipe: @recipe, inventory: @inventory)

    inventory_food_quantities = @inventory.inventory_foods.each_with_object({}) do |inv_food, hash|
      hash[inv_food.food_id] = inv_food.quantity
    end

    @recipe.recipe_foods.includes(:food).each do |recipe_food|
      required_qty = recipe_food.quantity
      available_qty = inventory_food_quantities[recipe_food.food_id] || 0

      if available_qty < required_qty
        needed_qty = required_qty - available_qty
        ShoppingListItem.create!(
          shopping_list: shopping_list,
          food: recipe_food.food,
          needed: needed_qty,
          unit_price: recipe_food.food.price,
          total_value: needed_qty * recipe_food.food.price
        )
      end
    end

    redirect_to shopping_list_path(shopping_list)
  end

  def show
    @shopping_list = current_user.shopping_lists.includes(shopping_list_items: :food).find(params[:id])
    @missing_items = @shopping_list.shopping_list_items.includes(:food)
  end
end
