# == Schema Information
#
# Table name: buyer_activity_types
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  duration_toggle         :string
#  property_address_toggle :string
#  zipcode_toggle          :string
#  detail_toggle           :string
#  comment_toggle          :string
#  image_toggle            :string
#  subject_toggle          :string
#  agent_toggle            :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  title                   :string
#  city_toggle             :string
#  state_toggle            :string
#

class BuyerActivityType < ApplicationRecord
  belongs_to :user
  has_many :buyer_activities, :dependent => :destroy
end
