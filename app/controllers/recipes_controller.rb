class RecipesController < ApplicationController
  layout "admin"
  def index
    @recipes = Recipe.all
  end

  def new
  end

  def create
    @recipe = Recipe.create(recipe_params)
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

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end 
end
