class Recipe < ActiveRecord::Base

  validates :title, presence: true,
                    length: { minimum: 3 }
  validates :description, presence: true

  belongs_to :user

  has_one :direction

  has_many :inclusions, dependent: :destroy
  has_many :recipe_ingredients, through: :inclusions, source: :ingredient

  #has_many :categorizations, dependent: :destroy
  #has_many :categories, through: :categorizations
  belongs_to :category

  mount_uploader :image, ImageUploader

  # after_initialize :set_defaults

  private

  #def set_defaults
  #  self.image ||= "/app/assets/images/default_image.png"
  #end

end
