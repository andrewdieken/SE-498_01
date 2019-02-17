FactoryBot.define do
  factory :voter do
    voterID { "" }
    last_name { "MyString" }
    first_name { "MyString" }
    middle_name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { "MyString" }
    email { "MyString" }
    phone { "MyString" }
    date_of_birth { "MyString" }
    party_affiliation { "MyString" }
  end
end
