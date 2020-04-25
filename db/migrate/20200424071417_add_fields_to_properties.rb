class AddFieldsToProperties < ActiveRecord::Migration[5.1]
  def up
    add_column :properties, :showing_number_1, :integer, default: 0
    add_column :properties, :showing_number_2, :integer, default: 0
    add_column :properties, :showing_number_3, :integer, default: 0
    add_column :properties, :offer, :integer, default: 0
    add_column :properties, :contract, :integer, default: 0
  end

  def down
    remove_columns :properties, :showing_number_1, :showing_number_2 , :showing_number_3, :offer, :contract
  end
end
