# == Schema Information
#
# Table name: activity_types
#
#  id                  :integer          not null, primary key
#  title               :string
#  cost_toggle         :string
#  duration_toggle     :string
#  detail_toggle       :string
#  outcome_toggle      :string
#  contact_toggle      :string
#  flyer_img_toggle    :string
#  postcard_img_toggle :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class ActivityType < ApplicationRecord
    has_many :activities, :dependent => :destroy
end
