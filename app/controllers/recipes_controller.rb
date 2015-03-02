class RecipesController < ApplicationController
  def index
    @recipes = if params[:keywords]
    Recipe.where('name ilike ?', "%#{params[:keywords]}%")
    else
      []
    end
  end

  def show 
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.create recipe_params
  end

  def update
    @recipe = Recipe.find params[:id]
    @recipe.update_attributes recipe_params
  end

  def destroy
    recipe = Recipe.find params[:id]
    recipe.destroy
  end
private
  def recipe_params
    params.require(:recipe).permit(
      :name,
      :instructions
    )
  end


end
