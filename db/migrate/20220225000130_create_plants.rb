class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :species
      t.integer :sun_exposure
      t.integer :watering_freq

      t.timestamps
    end
  end
end
