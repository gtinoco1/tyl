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
#  price_min   :string
#  price_max   :string
#  bed         :string
#  bath        :string
#  house       :string
#  condo       :string
#  wd          :string
#  balcony     :string
#  parking     :string
#  garage      :string
#  pool        :string
#  notes       :text
#

class Buyer < ApplicationRecord
  belongs_to :user
  has_many :buyer_activities, :dependent => :destroy
  
  validates :name, :presence => {:message => "can't be blank."}
  
  def to_s
    "#{name}"
  end
  
end
