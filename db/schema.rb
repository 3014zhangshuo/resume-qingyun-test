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

ActiveRecord::Schema.define(version: 20170209030327) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "resume_id"
    t.string   "token"
    t.string   "plan"
    t.integer  "plan_amount"
    t.string   "money"
    t.string   "paymethod"
    t.boolean  "is_paid",     default: false
    t.string   "pay_code"
    t.string   "paid_code"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "aasm_state",  default: "order_placed"
    t.index ["aasm_state"], name: "index_orders_on_aasm_state"
  end

  create_table "resume_htmls", force: :cascade do |t|
    t.integer  "resume_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resume_images", force: :cascade do |t|
    t.integer  "resume_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "one_line_description"
    t.string   "self_description"
    t.string   "past_description1"
    t.string   "past_description2"
    t.string   "why_employer"
    t.string   "why_employee1"
    t.string   "why_employee2"
    t.string   "why_employee3"
    t.string   "past_project_title1"
    t.string   "past_project_title2"
    t.string   "past_project_title3"
    t.string   "past_project_description1"
    t.string   "past_project_description2"
    t.string   "past_project_description3"
    t.string   "past_project_image1"
    t.string   "past_project_image2"
    t.string   "past_project_image3"
    t.string   "contact_details1"
    t.string   "contact_details2"
    t.string   "contact_details3"
    t.string   "contact_details4"
    t.string   "name_resume"
    t.string   "resume_name"
    t.string   "answer23"
    t.string   "answer24"
    t.string   "answer25"
    t.string   "answer26"
    t.string   "answer27"
    t.string   "answer28"
    t.string   "answer29"
    t.string   "answer30"
    t.string   "answer31"
    t.string   "answer32"
    t.string   "answer33"
    t.string   "answer34"
    t.string   "answer35"
    t.string   "answer36"
    t.string   "answer37"
    t.string   "answer38"
    t.string   "answer39"
    t.string   "answer40"
    t.string   "answer41"
    t.string   "answer42"
    t.string   "answer43"
    t.string   "answer44"
    t.string   "answer45"
    t.string   "answer46"
    t.string   "answer47"
    t.string   "answer48"
    t.string   "answer49"
    t.string   "answer50"
    t.string   "answer51"
    t.string   "answer52"
    t.string   "answer53"
    t.string   "answer54"
    t.string   "answer55"
    t.string   "answer56"
    t.string   "answer57"
    t.string   "answer58"
    t.string   "answer59"
    t.integer  "user_id"
    t.string   "aasm_state",                default: "drafting"
    t.boolean  "is_paid",                   default: false
    t.string   "category"
    t.index ["aasm_state"], name: "index_resumes_on_aasm_state"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.string   "user_code"
    t.boolean  "is_confirmed",           default: false
    t.string   "confirm_code"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
