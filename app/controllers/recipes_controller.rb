class RecipesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]


  def index
    @recipes = Recipe.all
    #use first otherwise it will return a record.
    @appetizers = Category.category_search('Appetizer')
    @entrees = Category.category_search('Entree')
    @desserts = Category.category_search('Dessert')
    @sides = Category.category_search('Sides')
    @bulk_recipes = Category.category_search('Bulk Recipe')
    @inactive = Category.category_search('InActive')
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.directions.build
  end

  def create
    @recipe = current_user.recipes.new recipe_params

    # if @recipe.save
    if @recipe.build_recipe(recipe_params)
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
    if @recipe.build_recipe(recipe_params)
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
    params.require(:recipe).permit(:title, :description, :image, :category_id, { ingredients_attributes: ingredient_params }, { directions_attributes: directions_params } )
  end

  def ingredient_params
    [:id, :qty, :unit, :name, :calories, :total_fat, :saturated_fat, :trans_fat, :cholesterol, :sodium, :total_carbs, :dietary_fiber, :sugars, :protein, :vitamin_a, :vitamin_c, :calcium, :iron, :nutrient_databank_number, :serving_weight, :nutritionix_id, :_destroy]
  end

  def directions_params
    [:id, :step, :instruction, :_destroy]
  end

end
