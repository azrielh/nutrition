class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.integer :step
      t.text :instruction
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
