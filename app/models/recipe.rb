class Recipe < ActiveRecord::Base

  validates :title, presence: true,
                    length: { minimum: 3 }
  validates :description, presence: true

  belongs_to :user
  belongs_to :category

  has_many :directions, dependent: :destroy
  has_many :ingredients, dependent: :destroy

  mount_uploader :image, ImageUploader

  def update_recipe_ingredients
    ActiveRecord::Base.transaction do
      set_zeros
      calc_weight
      calc_it
      save ? self : false
    end
  end

  def build_recipe(recipe_params)
    # this adds all the transactions in one commit.
    ActiveRecord::Base.transaction do
      save_or_update(recipe_params)
      set_zeros
      calc_weight
      calc_it
      save ? self : false
    end
  end

  def save_or_update(data)
    persisted? ? update(data) : save
  end

  private

  def calc_it
    self.calories = calc_calorie
    self.total_fat = calc_total_fat
    self.saturated_fat = calc_sat_fat
    self.trans_fat = calc_trans_fat
    self.cholesterol = calc_cholesterol
    self.sodium = calc_sodium
    self.total_carbs = calc_total_carbs
    self.dietary_fiber = calc_dietary_fiber
    self.sugars = calc_sugars
    self.protein = calc_protein
    self.vitamin_a = calc_vitamin_a
    self.vitamin_c = calc_vitamin_c
    self.calcium = calc_calcium
    self.iron = calc_iron
  end

  def calc_weight
    self.total_weight = self.ingredients.sum(:qty)
  end
  # this calculates the values correctly...
  def calc_calorie
    self.ingredients.map {|x| x.calories * x.qty }.sum
  end

  def calc_total_fat
    self.ingredients.map {|x| x.total_fat * x.qty }.sum
  end

  def calc_sat_fat
    self.ingredients.map {|x| x.saturated_fat * x.qty }.sum
  end

  def calc_trans_fat
    self.ingredients.map {|x| x.trans_fat * x.qty }.sum
  end

  def calc_cholesterol
    self.ingredients.map {|x| x.cholesterol * x.qty }.sum * 1000
  end

  def calc_sodium
    self.ingredients.map {|x| x.sodium * x.qty }.sum * 1000
  end

  def calc_total_carbs
    self.ingredients.map {|x| x.total_carbs * x.qty }.sum
  end

  def calc_dietary_fiber
    self.ingredients.map {|x| x.dietary_fiber * x.qty }.sum
  end

  def calc_sugars
    self.ingredients.map {|x| x.sugars * x.qty }.sum
  end

  def calc_protein
    self.ingredients.map {|x| x.protein * x.qty }.sum
  end

  def calc_vitamin_a
    self.ingredients.map {|x| x.vitamin_a * x.qty }.sum
  end

  def calc_vitamin_c
    self.ingredients.map {|x| x.vitamin_c * x.qty }.sum
  end

  def calc_calcium
    self.ingredients.map {|x| x.calcium * x.qty }.sum
  end

  def calc_iron
    self.ingredients.map {|x| x.iron * x.qty }.sum
  end

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
    self.servings ||= 1
  end

end
