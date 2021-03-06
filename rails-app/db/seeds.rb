# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

fields = %w{lVoterUniqueID sAffNumber szStateVoterID sVoterTitle szNameLast szNameFirst szNameMiddle sNameSuffix sGender szSitusAddress szSitusCity sSitusState sSitusZip sHouseNum sUnitAbbr sUnitNum szStreetName sStreetSuffix sPreDir sPostDir szMailAddress1 szMailAddress2 szMailAddress3 szMailAddress4 szMailZip szPhone szEmailAddress dtBirthDate sBirthPlace dtRegDate dtOrigRegDate dtLastUpdate_dt sStatusCode szStatusReasonDesc sUserCode1 sUserCode2 iDuplicateIDFlag szLanguageName szPartyName szAVStatusAbbr szAVStatusDesc szPrecinctName sPrecinctID sPrecinctPortion sDistrictID_0 iSubDistrict_0 szDistrictName_0 sDistrictID_1 iSubDistrict_1 szDistrictName_1 sDistrictID_2 iSubDistrict_2 szDistrictName_2 sDistrictID_3 iSubDistrict_3 szDistrictName_3 sDistrictID_4 iSubDistrict_4 szDistrictName_4 sDistrictID_5 iSubDistrict_5 szDistrictName_5}

if Rails.env.production?
CSV.foreach(Dir.pwd + "/db/prod.csv", encoding: 'iso-8859-1:utf-8', headers: true) do |row|
  attrs = row.to_hash.slice(*fields).transform_values { |v| v || "none" }
  Voter.create!(attrs)
end
elsif Rails.env.development?
  CSV.foreach(Dir.pwd + "/db/Cntywd_020819.csv", headers: true) do |row|
  attrs = row.to_hash.slice(*fields).transform_values { |v| v || "none" }
  Voter.create!(attrs)
  end
elsif
  CSV.foreach(Dir.pwd + "/db/Cntywd_020819.csv", headers: true) do |row|
  attrs = row.to_hash.slice(*fields).transform_values { |v| v || "none" }
  Voter.create!(attrs)
end
else
  visit = Visit.create(:created_at => '2019-04-24 19:42:31', :updated_at => '2019-04-24 19:45:00', :voter_id => '0123456789')
end
