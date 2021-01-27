# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200522112946) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "activities", force: :cascade do |t|
    t.integer "activity_type_id"
    t.date "date"
    t.float "duration"
    t.float "cost"
    t.integer "property_id"
    t.text "detail"
    t.text "outcome"
    t.string "contact"
    t.text "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agent"
    t.string "customer"
    t.integer "sort"
  end

  create_table "activity_types", force: :cascade do |t|
    t.string "title"
    t.string "cost_toggle"
    t.string "duration_toggle"
    t.string "detail_toggle"
    t.string "outcome_toggle"
    t.string "contact_toggle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agent_toggle"
    t.string "customer_toggle"
    t.string "subject_toggle"
    t.integer "user_id"
    t.string "color_code", default: "#fffff"
    t.string "status", default: "active"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "admin"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "buyer_activities", force: :cascade do |t|
    t.integer "duration"
    t.string "property_address"
    t.integer "zipcode"
    t.string "detail"
    t.string "comment"
    t.string "image"
    t.integer "buyer_id"
    t.integer "buyer_activity_type_id"
    t.date "date"
    t.string "subject"
    t.string "agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "state"
  end

  create_table "buyer_activity_types", force: :cascade do |t|
    t.integer "user_id"
    t.string "duration_toggle"
    t.string "property_address_toggle"
    t.string "zipcode_toggle"
    t.string "detail_toggle"
    t.string "comment_toggle"
    t.string "image_toggle"
    t.string "subject_toggle"
    t.string "agent_toggle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "city_toggle"
    t.string "state_toggle"
  end

  create_table "buyers", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "funds"
    t.integer "downpayment"
    t.string "preapproval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "buyer_type"
    t.string "status"
    t.string "price_min"
    t.string "price_max"
    t.string "bed"
    t.string "bath"
    t.string "house"
    t.string "condo"
    t.string "wd"
    t.string "balcony"
    t.string "parking"
    t.string "garage"
    t.string "pool"
    t.text "notes"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "headshot_coordinates", force: :cascade do |t|
    t.integer "crop_x", default: 0
    t.integer "crop_y", default: 0
    t.integer "crop_h", default: 0
    t.integer "crop_w", default: 0
    t.integer "rotate", default: 0
    t.integer "user_headshot_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer "property_id"
    t.float "amount"
    t.text "detail"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.integer "realtor_id"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "listing_type"
    t.integer "sort"
    t.integer "showing_number_1", default: 0
    t.integer "showing_number_2", default: 0
    t.integer "showing_number_3", default: 0
    t.integer "offer", default: 0
    t.integer "contract", default: 0
  end

  create_table "property_attachments", force: :cascade do |t|
    t.integer "property_id"
    t.integer "user_id"
    t.integer "activity_id"
    t.string "attachment"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pages"
  end

  create_table "replies", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "headshot"
    t.string "phone"
    t.string "agency"
    t.text "website"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "activiy_order", default: "asc"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
