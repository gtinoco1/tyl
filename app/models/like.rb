# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  comment_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :comment
end
