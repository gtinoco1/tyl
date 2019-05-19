# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  headshot               :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties, :foreign_key => "realtor_id", :dependent => :destroy
  has_many :activity_types, :dependent => :destroy
  has_many :buyers, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :buyer_activity_types, :dependent => :destroy
  has_many :replies, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :property_attachments, :dependent => :destroy
  validates :last_name, :presence => true
  validates :first_name, :presence => true

  after_create :add_types

  mount_uploader :headshot, HeadshotUploader

  def add_types
    ActivityType.create(user: self, title: "Showing",
                        cost_toggle: "Hide",
                        duration_toggle: "Show",
                        detail_toggle: "Show",
                        outcome_toggle: "Hide",
                        contact_toggle: "Hide",
                        subject_toggle: "Show",
                        agent_toggle: "Show",
                        customer_toggle: "Show")

    ActivityType.create(user: self, title: "Postcard",
                        cost_toggle: "Show",
                        duration_toggle: "Show",
                        detail_toggle: "Hide",
                        outcome_toggle: "Hide",
                        contact_toggle: "Show",
                        flyer_img_toggle: "Hide",
                        postcard_img_toggle: "Show",
                        subject_toggle: "Show",
                        agent_toggle: "Hide",
                        customer_toggle: "Hide")

    ActivityType.create(user: self, title: "Other",
                        cost_toggle: "Show",
                        duration_toggle: "Show",
                        detail_toggle: "Show",
                        outcome_toggle: "Show",
                        contact_toggle: "Show",
                        subject_toggle: "Show",
                        agent_toggle: "Show",
                        customer_toggle: "Show")

    ActivityType.create(user: self, title: "Listing Agreement Paperwork",
                        cost_toggle: "Hide",
                        duration_toggle: "Show",
                        detail_toggle: "Show",
                        outcome_toggle: "Hide",
                        contact_toggle: "Hide",
                        flyer_img_toggle: "Hide",
                        postcard_img_toggle: "Hide",
                        subject_toggle: "Hide",
                        agent_toggle: "Hide",
                        customer_toggle: "Hide")

    ActivityType.create(user: self, title: "Flyer",
                        cost_toggle: "Show",
                        duration_toggle: "Show",
                        detail_toggle: "Hide",
                        outcome_toggle: "Hide",
                        contact_toggle: "Show",
                        flyer_img_toggle: "Show",
                        postcard_img_toggle: "Hide",
                        subject_toggle: "Show",
                        agent_toggle: "Hide",
                        customer_toggle: "Hide")

    ActivityType.create(user: self, title: "Call",
                        cost_toggle: "Hide",
                        duration_toggle: "Show",
                        detail_toggle: "Show",
                        outcome_toggle: "Hide",
                        contact_toggle: "Show",
                        flyer_img_toggle: "Hide",
                        postcard_img_toggle: "Hide",
                        subject_toggle: "Show",
                        agent_toggle: "Hide",
                        customer_toggle: "Hide")

    BuyerActivityType.create(user: self, title: "Showing",
                             zipcode_toggle: "Show",
                             duration_toggle: "Show",
                             detail_toggle: "Hide",
                             comment_toggle: "Show",
                             property_address_toggle: "Show",
                             image_toggle: "Hide",
                             subject_toggle: "Hide",
                             agent_toggle: "Show")

    BuyerActivityType.create(user: self, title: "Offer Paperwork",
                             duration_toggle: "Show",
                             property_address_toggle: "Show",
                             zipcode_toggle: "Show",
                             detail_toggle: "Show",
                             comment_toggle: "Hide",
                             image_toggle: "Hide",
                             subject_toggle: "Hide",
                             agent_toggle: "Hide")

    BuyerActivityType.create(user: self, title: "Make Appointments",
                             duration_toggle: "Show",
                             property_address_toggle: "Show",
                             zipcode_toggle: "Show",
                             detail_toggle: "Show",
                             comment_toggle: "Hide",
                             image_toggle: "Hide",
                             subject_toggle: "Hide",
                             agent_toggle: "Hide")
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
