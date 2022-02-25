class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :age
      t.string :email

      t.timestamps

    end
  end
end

# Methods: # add_column, # add_index, # change_column, # change_table, # create_table, # drop_table, # remove_column, # remove_index, # rename_column

# Supported column types: :binary, :boolean, :date, :datetime, :decimal, :float, :integer, :primary_key, :string, :text, :time, :timestamps