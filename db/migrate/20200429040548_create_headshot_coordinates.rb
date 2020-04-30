class CreateHeadshotCoordinates < ActiveRecord::Migration[5.1]
  def change
    create_table :headshot_coordinates do |t|
      t.integer :crop_x, default: 0
      t.integer :crop_y, default: 0
      t.integer :crop_h, default: 0
      t.integer :crop_w, default: 0
      t.integer :rotate, default: 0
      t.integer :user_headshot_id
    end
  end
end
