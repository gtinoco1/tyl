ActiveAdmin.register Property do
  actions :all, :except => [:destroy]
  index :download_links => [:csv, :xml, :json]
  permit_params :address, :realtor_id, :city, :state, :zipcode, :status, :listing_type

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
  column(:user_id) { |property| property.user.email }
  column(:property_address) { |property| property.address }
  column(:city) { |property| property.city }
  column(:state) { |property| property.state }
  column(:zipcode) { |property| property.zipcode }
  column(:status) { |property| property.status }
  column(:created_at) { |property| property.created_at }
  column(:updated at) { |property| property.updated_at }
  column(:listing_type) { |property| property.listing_type }
end

end
