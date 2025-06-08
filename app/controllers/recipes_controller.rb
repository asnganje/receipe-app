class RecipesController < ApplicationController
  layout "admin"
  def index
    @recipes = Recipe.all
  end
end
