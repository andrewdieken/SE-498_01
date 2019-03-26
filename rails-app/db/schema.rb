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

ActiveRecord::Schema.define(version: 2019_03_26_043922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "voter_id"
    t.index ["voter_id"], name: "index_visits_on_voter_id"
  end

  create_table "voters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lVoterUniqueID"
    t.integer "sAffNumber"
    t.integer "szStateVoterID"
    t.string "sVoterTitle"
    t.string "szNameLast"
    t.string "szNameFirst"
    t.string "szNameMiddle"
    t.string "sNameSuffix"
    t.string "sGender"
    t.string "szSitusAddress"
    t.string "szSitusCity"
    t.string "sSitusState"
    t.integer "sSitusZip"
    t.integer "sHouseNum"
    t.string "sUnitAbbr"
    t.integer "sUnitNum"
    t.string "szStreetName"
    t.string "sStreetSuffix"
    t.string "sPreDir"
    t.string "sPostDir"
    t.string "szMailAddress1"
    t.string "szMailAddress2"
    t.string "szMailAddress3"
    t.string "szMailAddress4"
    t.integer "szMailZip"
    t.string "szPhone"
    t.string "szEmailAddress"
    t.string "dtBirthDate"
    t.string "sBirthPlace"
    t.string "dtRegDate"
    t.string "dtOrigRegDate"
    t.string "dtLastUpdate_dt"
    t.integer "sStatusCode"
    t.string "szStatusReasonDesc"
    t.integer "sUserCode1"
    t.integer "sUserCode2"
    t.string "iDuplicateIDFlag"
    t.string "szLanguageName"
    t.string "szPartyName"
    t.string "szAVStatusAbbr"
    t.string "szAVStatusDesc"
    t.string "szPrecinctName"
    t.string "sPrecinctID"
    t.string "sPrecinctPortion"
    t.string "sDistrictID_0"
    t.string "iSubDistrict_0"
    t.string "szDistrictName_0"
    t.string "sDistrictID_1"
    t.string "iSubDistrict_1"
    t.string "szDistrictName_1"
    t.string "sDistrictID_2"
    t.string "iSubDistrict_2"
    t.string "szDistrictName_2"
    t.string "sDistrictID_3"
    t.string "iSubDistrict_3"
    t.string "szDistrictName_3"
    t.string "sDistrictID_4"
    t.string "iSubDistrict_4"
    t.string "szDistrictName_4"
    t.string "sDistrictID_5"
    t.string "iSubDistrict_5"
    t.string "szDistrictName_5"
  end

  add_foreign_key "visits", "voters"
end
