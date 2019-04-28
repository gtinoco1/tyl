# == Schema Information
#
# Table name: property_attachments
#
#  id          :integer          not null, primary key
#  property_id :integer
#  user_id     :integer
#  activity_id :integer
#  attachment  :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  pages       :integer
#

class PropertyAttachment < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :activity, :required => false
  
  mount_uploader :attachment, AttachmentUploader
end
