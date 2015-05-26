class RemoveColumnFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :sort, :string
  end
end
