class InventoriesController < ApplicationController
  layout "admin"
  before_action :set_inventory, only: [ :show, :destroy ]
  def index
    @inventories=Inventory.all
  end

  def new
  end

  def show
  end

  def create
    @inventory = current_user.inventories.create(inventory_params)
    if @inventory.save
      respond_to do |format|
        format.html { redirect_to inventories_url, notice: "Inventory added" }
      end
    else
      respond_to do |format|
        format.html { redirect_to inventories_url, alert: @inventory.errors.full_messages }
      end
    end
  end

  def destroy
    if @inventory.destroy
      respond_to do |format|
        format.html { redirect_to inventories_url, notice: "Inventory deleted" }
      end
    else
      respond_to do |format|
        format.html { redirect_to inventories_url, alert: @inventory.errors.full_messages[0] }
      end
    end
  end

  private
  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end

  def set_inventory
    @inventory= Inventory.find(params[:id])
  end
end
