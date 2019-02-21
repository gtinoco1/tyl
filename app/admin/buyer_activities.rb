ActiveAdmin.register BuyerActivity do
  permit_params :duration, :property_address, :zipcode, :detail, :comment, :image, :buyer_id, :buyer_activity_type_id, :date, :subject, :agent

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

