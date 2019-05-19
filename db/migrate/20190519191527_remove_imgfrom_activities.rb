class RemoveImgfromActivities < ActiveRecord::Migration[5.1]
  def change
    remove_column :activities, :postcard__img
    remove_column :activities, :flyer_img
  end
end
