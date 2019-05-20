class RemoveImgfromActivityTypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :activity_types, :postcard_img_toggle
    remove_column :activity_types, :flyer_img_toggle
  end
end
