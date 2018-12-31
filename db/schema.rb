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

ActiveRecord::Schema.define(version: 2018_12_30_100834) do

  create_table "address_details", force: :cascade do |t|
    t.string "address_same"
    t.string "address_in_out"
    t.string "address"
    t.string "mobile_number"
    t.string "telephone_number"
    t.string "email"
    t.string "first_refer_address"
    t.string "first_refer_mobile_number"
    t.string "first_refer_telephone_number"
    t.string "second_refer_address"
    t.string "second_refer_mobile_number"
    t.string "second_refer_telephone_number"
    t.integer "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applicant_details", force: :cascade do |t|
    t.string "first_name"
    t.string "surname"
    t.string "other_names"
    t.string "name_changed"
    t.datetime "dob"
    t.string "city"
    t.string "select_country"
    t.string "select_state"
    t.string "select_district"
    t.string "select_gender"
    t.string "select_marital"
    t.string "select_citizenship"
    t.string "select_employment"
    t.string "select_gov_servant"
    t.string "select_qualification"
    t.string "select_non_e_c_r"
    t.string "aadhaar_number"
    t.string "voter_id"
    t.string "pan_id"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "family_details", force: :cascade do |t|
    t.string "father_name"
    t.string "father_surname"
    t.string "guardian_name"
    t.string "guardian_surname"
    t.string "mother_name"
    t.string "mother_surname"
    t.integer "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_details", force: :cascade do |t|
    t.string "passport_num"
    t.datetime "doi"
    t.datetime "doe"
    t.string "poi"
    t.string "passport_issue"
    t.string "charged"
    t.string "offence"
    t.string "denied"
    t.string "revoked"
    t.string "political_asylum"
    t.string "ec"
    t.string "place"
    t.string "date"
    t.integer "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "select_type"
    t.string "type_of_application"
    t.string "type_of_passport"
    t.string "validity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
