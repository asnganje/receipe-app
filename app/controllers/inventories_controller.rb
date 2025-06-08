class InventoriesController < ApplicationController
  layout "admin"
  def index
    @inventories=Inventory.all
  end
end
