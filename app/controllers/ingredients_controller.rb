class IngredientsController < ApplicationController

  before_action :authenticate_user!

  def create
    @recipe = Recipe.find params[:recipe_id]
    @ingredient = @recipe.ingredients.new ingredient_params

    respond_to do |format|
      if @ingredient.save
        @recipe.update_recipe_ingredients
        format.html { redirect_to recipe_path(@recipe) }
        format.js { render }
      else
        format.html { render "recipe/show" }
        format.js { render }
      end
    end

  end

  def destroy
    @recipe = Recipe.find params[:recipe_id]
    @ingredient = Ingredient.find params[:id]
    @ingredient.destroy
    @recipe.update_recipe
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: "Successfully Deleted" }
      format.js { render }
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:id, :qty, :unit, :name, :calories, :total_fat, :saturated_fat, :trans_fat, :cholesterol, :sodium, :total_carbs, :dietary_fiber, :sugars, :protein, :vitamin_a, :vitamin_c, :calcium, :iron, :nutrient_databank_number, :serving_weight, :nutritionix_id)
  end

end
