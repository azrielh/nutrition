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

  def destroy
    recipe = Recipe.find params[:recipe_id]
    @direction = Direction.find params[:id]
    @direction.destroy
    redirect_to recipe_path(recipe), notice: "Step deleted"
  end


  private

  def direction_params
    params.require(:direction).permit(:id, :step, :instruction)
  end


end
