ActiveAdmin.register BuyerActivityType do
  actions :all, :except => [:destroy]
  index :download_links => [:csv, :xml, :json]
  permit_params :user_id, :duration_toggle, :property_address_toggle, :zipcode_toggle, :detail_toggle, :comment_toggle, :image_toggle, :subject_toggle, :agent_toggle, :title

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :user_id, :duration_toggle, :property_address_toggle, :zipcode_toggle, :detail_toggle, :comment_toggle, :image_toggle,
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
