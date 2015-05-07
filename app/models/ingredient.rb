class Ingredient < ActiveRecord::Base
  has_many :inclusions, dependent: :destroy
  has_many :recipes, through: :inclusions

end
