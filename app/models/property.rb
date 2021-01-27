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
  has_many :property_attachments, :dependent => :destroy

  validates :address, :presence => true
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

  def to_s
    "#{address}"
  end

  def activities_count
    self.activities.count
  end

  def property_user
    self.user.first_name + " " + self.user.last_name
  end

  def date_of_last_activity
    self&.activities&.order("created_at DESC")&.first&.created_at&.strftime("%m/%d/%Y %H:%M %p")
  end
end
