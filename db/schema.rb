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

ActiveRecord::Schema.define(version: 20161207191601) do

  create_table "resumes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "answer00"
    t.string   "answer01"
    t.string   "answer02"
    t.string   "answer03"
    t.string   "answer04"
    t.string   "answer05"
    t.string   "answer06"
    t.string   "answer07"
    t.string   "answer08"
    t.string   "answer09"
    t.string   "answer10"
    t.string   "answer11"
    t.string   "answer12"
    t.string   "answer13"
    t.string   "answer14"
    t.string   "answer15"
    t.string   "answer16"
    t.string   "answer17"
    t.string   "answer18"
    t.string   "answer19"
    t.string   "answer20"
    t.string   "answer21"
    t.string   "answer22"
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
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
