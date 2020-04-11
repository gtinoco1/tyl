class AddFieldSortToProperty < ActiveRecord::Migration[5.1]
  def up
    add_column :properties, :sort, :integer
  end

  def down
    remove_columns :properties, :sort
  end
end
