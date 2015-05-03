class Category < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :recipes

  #has_many :categorizations, dependent: :destroy
  #has_many :recipes, through: :categorizations


  def self.category_search(cat)
    where(name: cat).first.recipes
  end

end