class RecipesController < ApplicationController
  layout "admin"
  before_action :set_recipe, only: [:destroy, :show]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
  end

  def create
    @recipe = current_user.recipes.create(recipe_params)
    if @recipe.save
      respond_to do |format|
        format.html {redirect_to recipes_url, notice:"Recipe added!"}
      end
    else
    respond_to do |format|
        format.html {redirect_to recipes_url, alert:@recipe.errors.full_messages[0]}
      end
    end
  end

  def destroy
    if @recipe.destroy
      respond_to do |format|
        format.html {redirect_to recipes_url, notice:"Recipe deleted!"}
      end
    else
      respond_to do |format|
        format.html {redirect_to recipes_url, alert:@recipe.errors.full_messages[0]}
      end
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_duration, :cooking_duration, :public)
  end 
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
