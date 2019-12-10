ActiveAdmin.register Activity do
  actions :all, :except => [:destroy]
  index :download_links => [:csv, :xml, :json]
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
    column(:email) { |activity| activity.property.user.email }
    column(:property_id) { |activity| activity.property.address }
    column(:activity_type_id) { |activity| activity.activity_type.title }
    column(:date) { |activity| activity.date }
    column(:duration) { |activity| activity.duration }
    column(:cost) { |activity| activity.cost }
    column(:detail) { |activity| activity.detail }
    column(:outcome) { |activity| activity.outcome }
    column(:contact) { |activity| activity.contact }
    column(:subject) { |activity| activity.subject }
    column(:agent) { |activity| activity.agent }
    column(:customer) { |activity| activity.customer }
  end

end

#  id               :integer          not null, primary key
#  activity_type_id :integer
#  date             :date
#  duration         :float
#  cost             :float
#  property_id      :integer
#  detail           :text
#  outcome          :text
#  contact          :string
#  subject          :text
#  flyer_img        :string
#  postcard__img    :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  agent            :string
#  customer         :string
