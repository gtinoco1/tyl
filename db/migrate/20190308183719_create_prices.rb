class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.integer :property_id
      t.float :amount
      t.text :detail
      t.date :date

      t.timestamps
    end
  end
end
