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
    @recipe.calories = @recipe.calorie_count
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "Successfully Created"
    else
      render :new
    end
  end

  def show
    #@recipe.ingredients.build
    # @ingredient = UsdaNutrientDatabase::Food.where("long_description ilike '%tomatoes%'")
    #@calories =
    # @food = UsdaNutrientDatabase::Food.first.foods_nutrients
    # This returns the Protein value (203)
    # UsdaNutrientDatabase::Food.first.foods_nutrients.where('nutrient_value ilik =  ).nutrient_value
    # this list all of the food nutrients values for the specific food..
    # UsdaNutrientDatabase::Food.first.foods_nutrients
    # This shows the nutrient description for the number
    # UsdaNutrientDatabase::Nutrient.find_by_nutrient_number(203).nutrient_description

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
    params.require(:recipe).permit(:title, :description, :image, :category_id, { ingredients_attributes: ingredient_params }, { directions_attributes: directions_params } )
  end

  def ingredient_params
    [:id, :qty, :unit, :name, :calories, :total_fat, :saturated_fat, :trans_fat, :cholesterol, :sodium, :total_carbs, :dietary_fiber, :sugars, :protein, :vitamin_a, :vitamin_c, :calcium, :iron, :nutrient_databank_number, :serving_weight, :nutritionix_id, :_destroy]
  end

  def directions_params
    [:id, :step, :instruction, :_destroy]
  end

end
