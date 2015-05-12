class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates :qty, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true

end
