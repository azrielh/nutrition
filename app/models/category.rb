class Category < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :recipes

  APPETIZER = 'Appetizer'
  ENTREE = 'Entrée'
  DESSERT = 'Dessert'
  SIDES = "Sides"
  BULK_RECIPES = "Bulk Recipes"
  INACTIVE = "In Active"

  def self.category_search(name)
    category = find_by_name name
    if category
      category.recipes
    else
      []
    end
  end

end
