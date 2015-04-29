class Recipe < ActiveRecord::Base

  validates :title, presence: true,
                    length: { minimum: 3 }
  validates :description, presence: true

  mount_uploader :image, ImageUploader

  # after_initialize :set_defaults

  private

  #def set_defaults
  #  self.image ||= "/app/assets/images/default_image.png"
  #end

end
