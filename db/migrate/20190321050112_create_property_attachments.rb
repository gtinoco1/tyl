class CreatePropertyAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :property_attachments do |t|
      t.integer :property_id
      t.integer :user_id
      t.integer :activity_id
      t.string :image
      t.string :title

      t.timestamps
    end
  end
end
