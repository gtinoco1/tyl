class AddPagesToPropertyAttachments < ActiveRecord::Migration[5.1]
  def change
    add_column :property_attachments, :pages, :integer
  end
end
