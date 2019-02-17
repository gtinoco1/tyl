class CreateBuyerActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :buyer_activities do |t|
      t.integer :duration
      t.string :property_address
      t.integer :zipcode
      t.string :detail
      t.string :comment
      t.string :image
      t.integer :buyer_id
      t.integer :buyer_activity_type_id
      t.date :date
      t.string :subject
      t.string :agent

      t.timestamps
    end
  end
end
