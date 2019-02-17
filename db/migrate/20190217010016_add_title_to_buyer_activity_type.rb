class AddTitleToBuyerActivityType < ActiveRecord::Migration[5.1]
  def change
     add_column :buyer_activity_types, :title, :string
  end
end
