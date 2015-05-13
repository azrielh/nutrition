class Category < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  
  has_many :recipes

  def self.category_search(cat)
    where(name: cat).first.recipes
  end

end
