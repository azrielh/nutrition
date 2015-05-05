class AddColumnIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :nutritionix_id, :string
  end
end
