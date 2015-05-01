class CreateInclusions < ActiveRecord::Migration
  def change
    create_table :inclusions do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
