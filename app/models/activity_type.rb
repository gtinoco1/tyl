# == Schema Information
#
# Table name: activity_types
#
#  id              :integer          not null, primary key
#  title           :string
#  cost_toggle     :string
#  duration_toggle :string
#  detail_toggle   :string
#  outcome_toggle  :string
#  contact_toggle  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  agent_toggle    :string
#  customer_toggle :string
#  subject_toggle  :string
#  user_id         :integer
#

class ActivityType < ApplicationRecord
  has_many :activities, :dependent => :destroy
  belongs_to :user

  validates :title, :presence => {:message => "Title can't be blank."}
  validates :title, :uniqueness => {:scope => [:user_id], :message => "already exists."}

  def self.colors
     [
     "#FCF4D0",
     "#FCDCA9",
     "#FBDDD9",
     "#EBBAB5",
     "#E4D0EC",
     "#CFACDC",
     "#E2ECAF",
     "#C2E0AE",
     "#C7EFE7",
     "#8ED2C5",
     "#D1E8F7",
     "#A6CBE4",
     "#D2D8D8",
     "#B8BFC7",
     "#F9FBFA",
     "#E9EAEC"
   ]
 end


end
