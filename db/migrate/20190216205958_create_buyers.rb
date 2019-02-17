class CreateBuyers < ActiveRecord::Migration[5.1]
  def change
    create_table :buyers do |t|
      t.integer :user_id
      t.string :name
      t.string :funds
      t.integer :downpayment
      t.string :preapproval

      t.timestamps
    end
  end
end
