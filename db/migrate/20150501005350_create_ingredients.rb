class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :nutrient_databank_number
      t.string :name
      t.string :unit
      t.float :qty
      t.float :calories
      t.float :total_fat
      t.float :saturated_fat
      t.float :trans_fat
      t.float :cholesterol
      t.float :sodium
      t.float :total_carbs
      t.float :dietary_fiber
      t.float :sugars
      t.float :protein
      t.float :vitamin_a
      t.float :vitamin_c
      t.float :calcium
      t.float :iron

      t.timestamps null: false
    end
  end
end
