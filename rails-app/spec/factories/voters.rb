FactoryBot.define do
  factory :voter do
    voterID { "1" }
    last_name { "Aaby" }
    first_name { "Dorothy" }
    middle_name { " " }
    address { "123 N Main Street" }
    city { "Orange" }
    state { "CA" }
    zip { "92866" }
    email { "d.aaby123@gmail.com" }
    phone { "714-123-4567" }
    date_of_birth { "01/02/1990" }
    party_affiliation { "Democrat" }
  end
end
