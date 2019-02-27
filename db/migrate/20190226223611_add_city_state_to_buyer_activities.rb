class AddCityStateToBuyerActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :buyer_activities, :city, :string
    add_column :buyer_activities, :state, :string
  end
end
