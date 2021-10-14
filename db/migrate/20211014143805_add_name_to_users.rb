class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :pseudo, :string
    add_column :users, :phone_number, :string
    add_column :users, :date_of_birth, :date
  end
end
