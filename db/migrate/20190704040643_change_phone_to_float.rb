class ChangePhoneToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :phone, :float
  end
end
