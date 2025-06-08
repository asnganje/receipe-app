class InventoryFoodsController < ApplicationController
  before_action :set_inventory, only: [:new, :create, :destroy]
  before_action :set_inventory_food, only:[:destroy]
  def new
    @inventory_food = @inventory.inventory_foods.new
  end

  def create
    @inventory_food = @inventory.inventory_foods.create(inventory_food_params)
    if @inventory_food.save
      respond_to do |format|
        format.html {redirect_to inventory_path(@inventory), notice:"Inventory food Item added" }
      end
    else
      respond_to do |format|
        format.html {redirect_to inventory_path(@inventory), notice:@inventory_food.errors.full_messages[0] }
      end
    end
  end

  def destroy
    if @inventory_food.destroy
      respond_to do |format|
        format.html {redirect_to inventory_path(@inventory), notice:"Inventory food Item deleted" }
      end
    else
      respond_to do |format|
        format.html {redirect_to inventory_path(@inventory), notice:@inventory_food.errors.full_messages[0] }
      end
    end
  end

  private
  def set_inventory_food
    @inventory_food = InventoryFood.find(params[:id])
  end
  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:food_id, :quantity)
  end
end
