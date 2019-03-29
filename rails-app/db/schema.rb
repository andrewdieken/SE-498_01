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

ActiveRecord::Schema.define(version: 2019_03_29_022105) do

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
    t.string "lVoterUniqueID", default: "none"
    t.string "sAffNumber", default: "none"
    t.string "szStateVoterID", default: "none"
    t.string "sVoterTitle", default: "none"
    t.string "szNameLast", default: "none"
    t.string "szNameFirst", default: "none"
    t.string "szNameMiddle", default: "none"
    t.string "sNameSuffix", default: "none"
    t.string "sGender", default: "none"
    t.string "szSitusAddress", default: "none"
    t.string "szSitusCity", default: "none"
    t.string "sSitusState", default: "none"
    t.string "sSitusZip", default: "none"
    t.string "sHouseNum", default: "none"
    t.string "sUnitAbbr", default: "none"
    t.string "sUnitNum", default: "none"
    t.string "szStreetName", default: "none"
    t.string "sStreetSuffix", default: "none"
    t.string "sPreDir", default: "none"
    t.string "sPostDir", default: "none"
    t.string "szMailAddress1", default: "none"
    t.string "szMailAddress2", default: "none"
    t.string "szMailAddress3", default: "none"
    t.string "szMailAddress4", default: "none"
    t.string "szMailZip", default: "none"
    t.string "szPhone", default: "none"
    t.string "szEmailAddress", default: "none"
    t.string "dtBirthDate", default: "none"
    t.string "sBirthPlace", default: "none"
    t.string "dtRegDate", default: "none"
    t.string "dtOrigRegDate", default: "none"
    t.string "dtLastUpdate_dt", default: "none"
    t.string "sStatusCode", default: "none"
    t.string "szStatusReasonDesc", default: "none"
    t.string "sUserCode1", default: "none"
    t.string "sUserCode2", default: "none"
    t.string "iDuplicateIDFlag", default: "none"
    t.string "szLanguageName", default: "none"
    t.string "szPartyName", default: "none"
    t.string "szAVStatusAbbr", default: "none"
    t.string "szAVStatusDesc", default: "none"
    t.string "szPrecinctName", default: "none"
    t.string "sPrecinctID", default: "none"
    t.string "sPrecinctPortion", default: "none"
    t.string "sDistrictID_0", default: "none"
    t.string "iSubDistrict_0", default: "none"
    t.string "szDistrictName_0", default: "none"
    t.string "sDistrictID_1", default: "none"
    t.string "iSubDistrict_1", default: "none"
    t.string "szDistrictName_1", default: "none"
    t.string "sDistrictID_2", default: "none"
    t.string "iSubDistrict_2", default: "none"
    t.string "szDistrictName_2", default: "none"
    t.string "sDistrictID_3", default: "none"
    t.string "iSubDistrict_3", default: "none"
    t.string "szDistrictName_3", default: "none"
    t.string "sDistrictID_4", default: "none"
    t.string "iSubDistrict_4", default: "none"
    t.string "szDistrictName_4", default: "none"
    t.string "sDistrictID_5", default: "none"
    t.string "iSubDistrict_5", default: "none"
    t.string "szDistrictName_5", default: "none"
  end

  add_foreign_key "visits", "voters"
end
