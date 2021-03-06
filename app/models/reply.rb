# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  comment_id :integer
#  user_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comment
end
