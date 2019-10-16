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

  csv do
    column :id
    column(:user_id) { |buyer_activity| buyer_activity.buyer.user.first_name }
    column(:user_id) { |buyer_activity| buyer_activity.buyer.user.last_name }
    column(:email) { |buyer_activity| buyer_activity.buyer.user.email }
    column(:buyer) { |buyer_activity| buyer_activity.buyer.name }
    column(:buyer_activity_type_id) { |buyer_activity| buyer_activity.buyer_activity_type.title }
    column(:date) { |buyer_activity| buyer_activity.date }
    column(:duration) { |buyer_activity| buyer_activity.duration }
    column(:subject) { |buyer_activity| buyer_activity.subject }
    column(:detail) { |buyer_activity| buyer_activity.detail }
    column(:comment) { |buyer_activity| buyer_activity.comment }
    column(:image) { |buyer_activity| buyer_activity.image }
    column(:agent) { |buyer_activity| buyer_activity.agent }
    column(:property_address) { |buyer_activity| buyer_activity.property_address }
    column(:city) { |buyer_activity| buyer_activity.city }
    column(:state) { |buyer_activity| buyer_activity.state }
    column(:zipcode) { |buyer_activity| buyer_activity.zipcode }
  end
  
end

