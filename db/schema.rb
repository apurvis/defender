# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151002104350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "case_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cases", force: :cascade do |t|
    t.integer  "attorney_id"
    t.string   "docket_number"
    t.string   "indictment_number"
    t.string   "status"
    t.string   "stage"
    t.string   "next_court_part"
    t.string   "release_status"
    t.string   "arrest_number"
    t.integer  "office_id"
    t.date     "opened_date"
    t.date     "closed_date"
    t.date     "disposition_date"
    t.string   "final_disposition"
    t.string   "city_disposition"
    t.date     "city_disposition_date"
    t.integer  "initial_top_charge_id"
    t.integer  "current_top_charge_id"
    t.integer  "disposition_top_charge_id"
    t.integer  "county_id"
    t.string   "top_sentence"
    t.boolean  "pro_bono"
    t.integer  "case_type_id"
    t.string   "sentence"
    t.string   "law_firm_matter_number"
    t.boolean  "school_related"
    t.string   "warrant_number"
    t.string   "court_index"
    t.boolean  "probation_issue"
    t.boolean  "probation_request"
    t.boolean  "evaluation"
    t.boolean  "conflict_check"
    t.string   "court_forum"
    t.integer  "practice_id"
    t.integer  "created_by_user_id"
    t.integer  "last_updated_by_user_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cases", ["attorney_id"], name: "index_cases_on_attorney_id", using: :btree
  add_index "cases", ["docket_number"], name: "index_cases_on_docket_number", unique: true, using: :btree

  create_table "charges", force: :cascade do |t|
    t.string   "name"
    t.string   "offense_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "defendants_cases", force: :cascade do |t|
    t.integer  "defendant_id"
    t.integer  "case_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "defendants_cases", ["case_id"], name: "index_defendants_cases_on_case_id", using: :btree
  add_index "defendants_cases", ["defendant_id"], name: "index_defendants_cases_on_defendant_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.string   "hearing_type"
    t.integer  "case_id"
    t.text     "comment"
    t.datetime "happened_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "events", ["case_id"], name: "index_events_on_case_id", using: :btree

  create_table "mailing_addresses", force: :cascade do |t|
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state",          limit: 2
    t.string   "zip_code"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "immigration_status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "people_cases", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "people_cases", ["case_id"], name: "index_people_cases_on_case_id", using: :btree
  add_index "people_cases", ["person_id"], name: "index_people_cases_on_person_id", using: :btree

  create_table "people_events", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "event_id"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "people_events", ["event_id"], name: "index_people_events_on_event_id", using: :btree
  add_index "people_events", ["person_id"], name: "index_people_events_on_person_id", using: :btree

  create_table "people_mailing_addresses", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "mailing_address_id"
    t.datetime "last_verified"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "description"
    t.string   "number"
    t.integer  "phoneable_id"
    t.string   "phoneable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "phone_numbers", ["phoneable_type", "phoneable_id"], name: "index_phone_numbers_on_phoneable_type_and_phoneable_id", using: :btree

  create_table "practices", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
