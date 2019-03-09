# == Schema Information
#
# Table name: properties
#
#  id           :integer          not null, primary key
#  address      :string
#  realtor_id   :integer
#  city         :string
#  state        :string
#  zipcode      :string
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  listing_type :string
#

class Property < ApplicationRecord
  belongs_to :user, :foreign_key => "realtor_id"
  has_many :activities, :dependent => :destroy
  has_many :prices, :dependent => :destroy

  # def self.to_csv
  #   attributes = ["subject"]
  #   CSV.generate(headers: true) do |csv|
  #     csv << attributes
  #         Property.first.activities.each do |activity|
  #         csv << attributes.map{ |attr| activity.send(attr) }
  #       end
  #     end
  # end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |property|
        csv << property.attributes.values_at(*column_names)
      end
    end
  end
end
