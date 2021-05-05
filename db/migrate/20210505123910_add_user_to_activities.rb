class AddUserToActivities < ActiveRecord::Migration[6.1]
  def change
    add_reference :activities, :user, null: true, foreign_key: true
  end
end
