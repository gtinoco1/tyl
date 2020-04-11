class AddActicityOrderInUser < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :activiy_order, :string, default: "asc"
  end

  def down
    remove_columns :users, :activiy_order
  end
end
