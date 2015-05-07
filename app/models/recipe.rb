class Recipe < ActiveRecord::Base

  validates :title, presence: true,
                    length: { minimum: 3 }
  validates :description, presence: true

  belongs_to :user

  has_many :directions

  has_many :inclusions, dependent: :destroy
  has_many :ingredients, through: :inclusions

  #has_many :categorizations, dependent: :destroy
  #has_many :categories, through: :categorizations
  belongs_to :category

  accepts_nested_attributes_for :ingredients, reject_if: lambda {|x|
                                              x[:qty].blank? && x[:name].blank? },
                                              allow_destroy: true

  accepts_nested_attributes_for :directions, reject_if: lambda {|x|
                                              x[:instruction].blank? },
                                              allow_destroy: true

  mount_uploader :image, ImageUploader

  before_save :set_zeros

  before_save :calculate_data

  private

  def calculate_data
    self.calories = self.ingredients.group(:calories).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.total_fat = self.ingredients.group(:total_fat).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.saturated_fat = self.ingredients.group(:saturated_fat).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.trans_fat = self.ingredients.group(:trans_fat).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.cholesterol = self.ingredients.group(:cholesterol).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.sodium = self.ingredients.group(:sodium).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.total_carbs = self.ingredients.group(:total_carbs).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.dietary_fiber = self.ingredients.group(:dietary_fiber).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.sugars = self.ingredients.group(:sugars).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.protein = self.ingredients.group(:protein).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.vitamin_a = self.ingredients.group(:vitamin_a).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.vitamin_c = self.ingredients.group(:vitamin_c).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.calcium = self.ingredients.group(:calcium).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
    self.iron = self.ingredients.group(:iron).count.keys.sum * self.ingredients.group(:qty).count.keys.sum
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
