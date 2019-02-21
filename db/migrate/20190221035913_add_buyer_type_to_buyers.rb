class AddBuyerTypeToBuyers < ActiveRecord::Migration[5.1]
  def change
  add_column :buyers, :buyer_type, :string
  end
end
