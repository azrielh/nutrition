class RecipesController < ApplicationController

  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "Successfully Created"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update recipe_params
      redirect_to recipe_path(@recipe), notice: "Recipe Successfully updated"
    else
      flash[:notice] = "Could not update"
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Successfully Deleted"
  end

  private

  def find_recipe
    @recipe = Recipe.find params[:id]
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description)
  end



end