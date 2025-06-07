class RecipesController < ApplicationController
  layout "admin"
  def index
    @recipes = []
    10.times.each do |i|
      @recipes << "recipe#{i}"
    end
  end
end
