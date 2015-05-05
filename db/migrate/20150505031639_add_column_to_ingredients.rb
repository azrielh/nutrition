class AddColumnToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :serving_weight, :float
  end
end
