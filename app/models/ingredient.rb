class Ingredient < ActiveRecord::Base
  has_many :inclusions
  has_many :ingredient_recipes, through: :inclusions, source: :recipe

end
