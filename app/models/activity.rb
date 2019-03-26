# == Schema Information
#
# Table name: activities
#
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
#

class Activity < ApplicationRecord
  belongs_to :property
  belongs_to :activity_type
  has_many :property_attachments, :dependent => :nullify

  validates :date, :presence => true

  mount_uploader :flyer_img, FlyerImgUploader
  mount_uploader :postcard__img, PostcardImgUploader
end


