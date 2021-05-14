class AddRoleToUsers < ActiveRecord::Migration[6.1] 
  def change
    add_reference :users, :role, null: true, foreing_key: true
  end
end
