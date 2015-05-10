class AddPriceToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :price, :decimal
  end
end
