class DirectionsController < ApplicationController

  def create
    recipe = Recipe.find params[:recipe_id]
    @direction = recipe.directions.new direction_params

    respond_to do |format|
      if @direction.save
        format.html { redirect_to recipe_path(recipe)}
        format.js { render }
      else
        format.html { render "recipe/show" }
        format.js { render }
      end
    end
  end

  private

  def direction_params
    params.require(:direction).permit(:id, :step, :instruction)
  end


end
