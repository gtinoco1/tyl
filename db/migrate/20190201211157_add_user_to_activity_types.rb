class AddUserToActivityTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :activity_types, :user_id, :integer
  end
end
