ActiveAdmin.register Activity do
  permit_params :activity_type_id, :date, :duration, :cost, :property_id, :detail, :outcome, :contact, :subject, :flyer_img, :postcard__img

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

  csv do
    column :id
    column(:user_id) { |activity| activity.property.user.first_name }
    column(:user_id) { |activity| activity.property.user.last_name }
    column(:property_id) { |activity| activity.property.address }
    column(:activity_type_id) { |activity| activity.activity_type.title }
    column(:date) { |activity| activity.date }
  end

end
