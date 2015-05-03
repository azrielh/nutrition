class Ingredient < ActiveRecord::Base
  has_many :inclusions, dependent: :destroy
  has_many :recipes, through: :inclusions

  def self.search_for(food)
    UsdaNutrientDatabase::Food.where("long_description ILIKE ? OR short_description ILIKE ?", "%#{food}%", "%#{food}%").where("food_group_code > 2100")
  end

end
