ActiveAdmin.register BuyerActivityType do
  permit_params :user_id, :duration_toggle, :property_address_toggle, :zipcode_toggle, :detail_toggle, :comment_toggle, :image_toggle, :subject_toggle, :agent_toggle

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
