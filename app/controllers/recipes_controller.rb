class RecipesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]


  def index
    @appetizers = Category.category_search(Category::APPETIZER)
    @entrees = Category.category_search(Category::ENTREE)
    @desserts = Category.category_search(DESSERT)
    @sides = Category.category_search(SIDES)
    @bulk_recipes = Category.category_search(BULK_RECIPES)
    @inactive = Category.category_search(INACTIVE)
    @recipe = Recipe.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new recipe_params
    if @recipe.build_recipe(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @ingredient = Ingredient.new
    @direction = Direction.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @recipe.build_recipe(recipe_params)
        format.html { redirect_to recipe_path(@recipe), notice: "Recipe Successfully updated" }
        format.json { respond_with_bip(@recipe) }
      else
        format.html { flash[:notice] = "Could not update" }
      end
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
    params.require(:recipe).permit(:title, :description, :image, :price, :servings, :category_id, { ingredients_attributes: ingredient_params }, { directions_attributes: directions_params } )
  end

  def ingredient_params
    [:id, :qty, :unit, :name, :calories, :total_fat, :saturated_fat, :trans_fat, :cholesterol, :sodium, :total_carbs, :dietary_fiber, :sugars, :protein, :vitamin_a, :vitamin_c, :calcium, :iron, :nutrient_databank_number, :serving_weight, :nutritionix_id, :_destroy]
  end

  def directions_params
    [:id, :step, :instruction, :_destroy]
  end

end
