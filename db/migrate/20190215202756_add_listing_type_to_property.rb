class AddListingTypeToProperty < ActiveRecord::Migration[5.1]
  def change
     add_column :properties, :listing_type, :string
  end
end
