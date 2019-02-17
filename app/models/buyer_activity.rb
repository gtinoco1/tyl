# == Schema Information
#
# Table name: buyer_activities
#
#  id                     :integer          not null, primary key
#  duration               :integer
#  property_address       :string
#  zipcode                :integer
#  detail                 :string
#  comment                :string
#  image                  :string
#  buyer_id               :integer
#  buyer_activity_type_id :integer
#  date                   :date
#  subject                :string
#  agent                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class BuyerActivity < ApplicationRecord
  belongs_to :buyer
  belongs_to :buyer_activity_type
end
