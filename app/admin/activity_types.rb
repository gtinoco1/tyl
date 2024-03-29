ActiveAdmin.register ActivityType do
  actions :all, :except => [:destroy]
  index :download_links => [:csv, :xml, :json]
  permit_params :title, :cost_toggle, :duration_toggle, :detail_toggle, :outcome_toggle,
                 :contact_toggle, :agent_toggle, :customer_toggle, :subject_toggle, :user_id, :created_at, :updated_at

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
