class AddAgentCustomerToActivities < ActiveRecord::Migration[5.1]
  def change
      add_column :activities, :agent, :string
      add_column :activities, :customer, :string
      add_column :activity_types, :agent_toggle, :string
      add_column :activity_types, :customer_toggle, :string
      add_column :activity_types, :subject_toggle, :string
  end
end
