class AddBuyerDetailsToBuyers < ActiveRecord::Migration[5.1]
  def change
    add_column :buyers, :price_min, :string
    add_column :buyers, :price_max, :string
    add_column :buyers, :bed, :string
    add_column :buyers, :bath, :string
    add_column :buyers, :house, :string
    add_column :buyers, :condo, :string
    add_column :buyers, :wd, :string
    add_column :buyers, :balcony, :string
    add_column :buyers, :parking, :string
    add_column :buyers, :garage, :string
    add_column :buyers, :pool, :string
    add_column :buyers, :notes, :text
  end
end
