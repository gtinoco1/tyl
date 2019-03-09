# == Schema Information
#
# Table name: prices
#
#  id          :integer          not null, primary key
#  property_id :integer
#  amount      :float
#  detail      :text
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Price < ApplicationRecord
    belongs_to :property
end
