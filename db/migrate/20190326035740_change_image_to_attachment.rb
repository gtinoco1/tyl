class ChangeImageToAttachment < ActiveRecord::Migration[5.1]
  def change
    rename_column :property_attachments, :image, :attachment
  end
end
