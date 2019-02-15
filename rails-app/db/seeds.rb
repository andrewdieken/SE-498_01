# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
voterslist = [
	[1080170, "Aaby", "Dorothy", "V", "2010 Pioneer Ave", "Fullterton", "CA", "92831", "000-680-6234", "", "07/23/1935", "Republican"],
	[2185680, "Aali", "Seyed", "Mohammad", "28 Deerwood E", "Irvine", "CA", "92604", "949-552-8664", "", "10/03/1930", "Democrat"],
	[3365293, "Byrne", "Vicki", "", "67 Wisteria Pl", "Aliso Viejo", "CA", "92656", "", "", "01/03/1973", "Republican"],
	[4154773, "Shieh", "Jiann", "Sheng", "9581 Woodlawn Dr", "Huntington Beach", "CA", "92646", "714-965-8828", "shieh.jiann@gmail.com", "02/11/1951", "N/A"]
]

voterslist.each do |voterid, lastname, firstname, middlename, address, city, state, zip, phone, email, dateofbirth, partyaffiliation |
	Voter.create(voterID: voterid, last_name: lastname, first_name: firstname, middle_name: middlename, address: address, city: city, state: state, zip: zip, phone: phone, email: email, date_of_birth: dateofbirth, party_affiliation: partyaffiliation)
end
