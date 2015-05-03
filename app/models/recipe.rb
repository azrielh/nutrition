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

  # after_initialize :set_defaults

  private

  #def set_defaults
  #  self.image ||= "/app/assets/images/default_image.png"
  #end

end
