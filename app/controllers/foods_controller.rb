class FoodsController < ApplicationController
  layout "admin"
  before_action :set_food, only: [ :destroy ]

  def index
    @foods=Food.all
  end

  def new
  end

  def create
    @food = Food.create(food_params)
    if @food.save
      respond_to do |format|
        format.html { redirect_to foods_url, notice: "Food added" }
      end
    else
      respond_to do |format|
        format.html { redirect_to foods_url, alert: @food.errors.full_messages[0] }
      end
    end
  end

  def destroy
    if @food.destroy
      respond_to do |format|
        format.html { redirect_to foods_url, notice: "Food deleted!" }
      end
    else
      respond_to do |format|
        format.html { redirect_to foods_url, alert: @food.errors.full_messages[0] }
      end
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
