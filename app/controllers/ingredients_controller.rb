class IngredientsController < ApplicationController

  before_action :authenticate_user!

  def create
    recipe = Recipe.find params[:recipe_id]
    @ingredient = recipe.ingredients.new ingredient_params

    respond_to do |format|
      if @ingredient.save
        recipe.update_recipe
        format.html { redirect_to recipe_path(recipe)}
        format.js { render }
      else
        format.html { render "recipe/show" }
        format.js { render }
      end
    end

  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:id, :qty, :unit, :name, :calories, :total_fat, :saturated_fat, :trans_fat, :cholesterol, :sodium, :total_carbs, :dietary_fiber, :sugars, :protein, :vitamin_a, :vitamin_c, :calcium, :iron, :nutrient_databank_number, :serving_weight, :nutritionix_id)
  end

end
