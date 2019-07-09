class AddAgencyToUsers < ActiveRecord::Migration[5.1]
  def change
      add_column :users, :agency, :string
      add_column :users, :website, :text
  end
end
