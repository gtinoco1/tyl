# == Schema Information
#
# Table name: buyers
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string
#  funds       :string
#  downpayment :integer
#  preapproval :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  buyer_type  :string
#  status      :string
#

class Buyer < ApplicationRecord
  belongs_to :user
  has_many :buyer_activities, :dependent => :destroy
  
  
  
  def to_s
    "#{name}"
  end
  
end
