class AddColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :calories, :float
    add_column :recipes, :total_fat, :float
    add_column :recipes, :saturated_fat, :float
    add_column :recipes, :trans_fat, :float
    add_column :recipes, :cholesterol, :float
    add_column :recipes, :sodium, :float
    add_column :recipes, :total_carbs, :float
    add_column :recipes, :dietary_fiber, :float
    add_column :recipes, :sugars, :float
    add_column :recipes, :protein, :float
    add_column :recipes, :vitamin_a, :float
    add_column :recipes, :vitamin_c, :float
    add_column :recipes, :calcium, :float
    add_column :recipes, :iron, :float
  end
end
