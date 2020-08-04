class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    # @recipe.ingredients.build(name: nil)
    # @recipe.ingredients.build(name: nil)
  end

  def create
    @recipe = Recipe.new (recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  private
    def recipe_params
      # binding.pry
      params.require(:recipe).permit(:title)
    end
end
