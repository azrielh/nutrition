class AddServingSizeColumnsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :servings, :integer
    add_column :recipes, :total_weight, :float
  end
end
