class DropTableUsdaFoodGroups < ActiveRecord::Migration
  def change
    # tables that were used for the USDA DB
    drop_table :usda_food_groups
    drop_table :usda_foods
    drop_table :usda_foods_nutrients
    drop_table :usda_footnotes
    drop_table :usda_nutrients
    drop_table :usda_source_codes
    drop_table :usda_weights
  end
end
