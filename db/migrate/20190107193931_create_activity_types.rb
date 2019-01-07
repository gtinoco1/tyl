class CreateActivityTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_types do |t|
      t.string :title
      t.string :cost_toggle
      t.string :duration_toggle
      t.string :detail_toggle
      t.string :outcome_toggle
      t.string :contact_toggle
      t.string :flyer_img_toggle
      t.string :postcard_img_toggle

      t.timestamps
    end
  end
end
