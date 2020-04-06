class AddFieldToActivity < ActiveRecord::Migration[5.1]
  def up
    add_column :activities, :sort, :integer
  end

  def down
    remove_columns :activities, :sort
  end
end
