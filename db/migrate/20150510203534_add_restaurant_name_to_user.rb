class AddRestaurantNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :rest_name, :string
  end
end
