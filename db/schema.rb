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

ActiveRecord::Schema.define(version: 20190308183719) do

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
    t.string "flyer_img"
    t.string "postcard__img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agent"
    t.string "customer"
  end

  create_table "activity_types", force: :cascade do |t|
    t.string "title"
    t.string "cost_toggle"
    t.string "duration_toggle"
    t.string "detail_toggle"
    t.string "outcome_toggle"
    t.string "contact_toggle"
    t.string "flyer_img_toggle"
    t.string "postcard_img_toggle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agent_toggle"
    t.string "customer_toggle"
    t.string "subject_toggle"
    t.integer "user_id"
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
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
