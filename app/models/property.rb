# == Schema Information
#
# Table name: properties
#
#  id         :integer          not null, primary key
#  address    :string
#  realtor_id :integer
#  city       :string
#  state      :string
#  zipcode    :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Property < ApplicationRecord
  belongs_to :user, :foreign_key => "realtor_id"
  has_many :activities, :dependent => :destroy
end
