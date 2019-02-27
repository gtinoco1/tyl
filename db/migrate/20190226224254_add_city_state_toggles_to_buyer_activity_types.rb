class AddCityStateTogglesToBuyerActivityTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :buyer_activity_types, :city_toggle, :string
    add_column :buyer_activity_types, :state_toggle, :string
  end
end
