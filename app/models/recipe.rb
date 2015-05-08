class Recipe < ActiveRecord::Base

  validates :title, presence: true,
                    length: { minimum: 3 }
  validates :description, presence: true

  belongs_to :user
  belongs_to :category

  has_many :directions, dependent: :destroy
  has_many :inclusions, dependent: :destroy
  has_many :ingredients, through: :inclusions

  accepts_nested_attributes_for :ingredients, reject_if: lambda {|x|
                                              x[:qty].blank? && x[:name].blank? },
                                              allow_destroy: true

  accepts_nested_attributes_for :directions, reject_if: lambda {|x|
                                              x[:instruction].blank? },
                                              allow_destroy: true

  mount_uploader :image, ImageUploader

  # before_save :set_zeros
  # before_save :calculate_data
  # before_save :calc_weight

  def build_recipe(recipe_params)
    # this adds all the transactions in one commit.
    ActiveRecord::Base.transaction do
      save_or_update(recipe_params)
      set_zeros
      calc_weight
      calculate_data
      save ? self :false
    end
  end

  def save_or_update(data)
    persisted? ? update!(data) : save!
  end

  private

  def calc_weight
    self.total_weight = self.ingredients.group(:qty).count.keys.sum
  end

  def qty_ingredients
    ingredients.group(:qty).count.keys.sum
  end

  def calculate_value_g(value_type)
    ingredients.group(value_type).count.keys.sum * qty_ingredients
  end

  def calculate_value_mg(value_type)
    ingredients.group(value_type).count.keys.sum * qty_ingredients
  end

  def calculate_data
    self.calories      = calculate_value_g(:calories)
    self.total_fat     = calculate_value_g(:total_fat)
    self.saturated_fat = calculate_value_g(:saturated_fat)
    self.trans_fat     = calculate_value_g(:trans_fat)
    self.cholesterol   = calculate_value_mg(:cholesterol)
    self.sodium        = calculate_value_mg(:sodium)
    self.total_carbs   = calculate_value_g(:total_carbs)
    self.dietary_fiber = calculate_value_g(:dietary_fiber)
    self.sugars        = calculate_value_g(:sugars)
    self.protein       = calculate_value_g(:protein)
    self.vitamin_a     = calculate_value_g(:vitamin_a)
    self.vitamin_c     = calculate_value_g(:vitamin_c)
    self.calcium       = calculate_value_g(:calcium)
    self.iron          = calculate_value_g(:iron)
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
  end


  #def set_defaults
  #  self.image ||= "/app/assets/images/default_image.png"
  #end

end
