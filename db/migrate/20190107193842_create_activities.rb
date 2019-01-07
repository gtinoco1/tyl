class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :activity_type_id
      t.date :date
      t.float :duration
      t.float :cost
      t.integer :property_id
      t.text :detail
      t.text :outcome
      t.string :contact
      t.text :subject
      t.string :flyer_img
      t.string :postcard__img

      t.timestamps
    end
  end
end
