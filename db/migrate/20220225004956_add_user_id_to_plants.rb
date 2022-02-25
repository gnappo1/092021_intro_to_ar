class AddUserIdToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :user_id, :integer
  end
end
