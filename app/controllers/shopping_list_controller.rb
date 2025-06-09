class ShoppingListController < ApplicationController
  layout "admin"
  def index
  end
  def new
    @inventories = Inventory.all
  end
end
