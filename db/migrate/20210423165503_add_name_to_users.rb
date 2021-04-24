class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :gender, :string
    add_column :users, :region, :string
    add_column :users, :school, :string
    add_column :users, :date_of_birth, :date
  end
end
