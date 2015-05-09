class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  # validates :qty, presence: true
  # validates :ingredient, presence: true

end
