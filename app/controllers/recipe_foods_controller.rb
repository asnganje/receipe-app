class RecipeFoodsController < ApplicationController
  layout "admin"
  before_action :set_recipe, only: [ :new, :create, :destroy ]
  before_action :set_recipe_food, only: [ :destroy ]

  def new
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe_food = @recipe.recipe_foods.create(recipe_food_params)

    if @recipe_food.save
      respond_to do |format|
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe food added!" }
      end
    else
      respond_to do |format|
        format.html { redirect_to recipe_url(@recipe), alert: @recipe_food.errors.full_messages[0] }
      end
    end
  end

  def destroy
    if @recipe_food.destroy
      respond_to do |format|
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe food deleted!" }
      end
    else
      respond_to do |format|
        format.html { redirect_to recipe_url(@recipe), notice: @recipe_food.errors.full_messages }
      end
    end
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
    puts "it is #{@recipe_food}"
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
