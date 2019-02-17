class CreateBuyerActivityTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :buyer_activity_types do |t|
      t.integer :user_id
      t.string :duration_toggle
      t.string :property_address_toggle
      t.string :zipcode_toggle
      t.string :detail_toggle
      t.string :comment_toggle
      t.string :image_toggle
      t.string :subject_toggle
      t.string :agent_toggle

      t.timestamps
    end
  end
end
