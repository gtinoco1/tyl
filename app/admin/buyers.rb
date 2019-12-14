ActiveAdmin.register Buyer do
  actions :all, :except => [:destroy]
  index :download_links => [:csv, :xml, :json]
  permit_params :user_id, :name, :funds, :downpayment, :preapproval, :buyer_type, :status, :price_min, :price_max, :bed, :bath, :house, :condo, :wd, :balcony, :parking, :garage, :pool, :notes

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end



end
