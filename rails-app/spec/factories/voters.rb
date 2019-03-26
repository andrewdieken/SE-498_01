FactoryBot.define do
  factory :voter do
    sequence(:lVoterUniqueID) { |i| i }
    sequence(:sAffNumber) { |i| i }
    sequence(:szStateVoterID) { |i| i }
    sVoterTitle { "Mx" }
    szNameLast { "Smith" }
    szNameFirst { "John" }
    szNameMiddle { "Doe" }
    sNameSuffix { "II" }
    sGender { "M" }
    szSitusAddress { "123 Main St" }
    szSitusCity { "Orange" }
    sSitusState { "CA" }
    sSitusZip { 98265 }
    sHouseNum { 1 }
    sPrecinctID { 1 }
  end
end
