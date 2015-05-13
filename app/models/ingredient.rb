class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates :qty, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true
  validates :calories, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total_fat, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :saturated_fat, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cholesterol, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sodium, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total_carbs, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :dietary_fiber, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sugars, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :protein, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :vitamin_a, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :vitamin_c, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :calcium, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :iron, presence: true, numericality: { greater_than_or_equal_to: 0 }

  after_create :set_zeros

  def set_zeros
    self.calories ||= 0
    self.total_fat ||= 0
    self.saturated_fat ||= 0
    self.trans_fat ||= 0
    self.cholesterol ||= 0
    self.sodium ||= 0
    self.total_carbs ||= 0
    self.dietary_fiber ||= 0
    self.sugars ||= 0
    self.protein ||= 0
    self.vitamin_a ||= 0
    self.vitamin_c ||= 0
    self.calcium ||= 0
    self.iron ||= 0
  end

end
