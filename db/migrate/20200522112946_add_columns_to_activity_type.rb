class AddColumnsToActivityType < ActiveRecord::Migration[5.1]
  def up
    add_column :activity_types, :color_code, :string, default: '#fff'
    add_column :activity_types, :status, :string, default: 'active'
  end

  def down
    remove_columns :activity_types, :color_code, :status
  end
end
