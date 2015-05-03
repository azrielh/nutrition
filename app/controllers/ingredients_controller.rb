class IngredientsController < ApplicationController

  def search
    # @foods = UsdaNutrientDatabase::Food.search_for(params[:search])
    @foods = UsdaNutrientDatabase::Food.where("long_description ILIKE ? OR short_description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    render :search
  end

  private

end
