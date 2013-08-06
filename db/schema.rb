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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130806003412) do

  create_table "case_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cases", :force => true do |t|
    t.integer  "attorney_id"
    t.string   "docket_number"
    t.string   "indictment_number"
    t.string   "status"
    t.string   "stage"
    t.date     "next_court_date"
    t.string   "next_court_part"
    t.string   "release_status"
    t.string   "new_york_state_id"
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
    t.string   "itype",                     :limit => 1,                 :comment => "a gender"
    t.string   "dtype",                     :limit => 1,                 :comment => "a gender"
    t.string   "status_flag"
    t.integer  "county_id"
    t.string   "top_sentence"
    t.boolean  "pro_bono"
    t.string   "lm_number"
    t.integer  "case_type_id"
    t.string   "docket_plus"
    t.integer  "number_of_codefendants"
    t.string   "sentence"
    t.string   "cab_number"
    t.string   "law_firm_matter_number"
    t.boolean  "aid"
    t.boolean  "dsp"
    t.boolean  "mica"
    t.boolean  "k_calendar"
    t.boolean  "contested"
    t.boolean  "board_case"
    t.boolean  "school_related"
    t.string   "warrant_number"
    t.string   "court_index"
    t.boolean  "probation_issue"
    t.boolean  "probation_request"
    t.boolean  "ati"
    t.boolean  "evaluation"
    t.boolean  "conflict_check"
    t.string   "start_workflow"
    t.string   "court_forum"
    t.integer  "practice_id"
    t.string   "case"
    t.integer  "created_by_user_id"
    t.integer  "last_updated_by_user_id"
    t.integer  "user_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "cases", ["attorney_id"], :name => "index_cases_on_attorney_id"
  add_index "cases", ["docket_number"], :name => "index_cases_on_docket_number", :unique => true

  create_table "charges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "counties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "defendants", :force => true do |t|
    t.string   "name"
    t.string   "immigration_status"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "offices", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "practices", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "type"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
