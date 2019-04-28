require "rails_helper"

RSpec.feature "user logs in" do
  let(:voter) { create(:voter) }
  let(:visit1) { create(:visit, voter_id: voter.id) }
  let(:user) { create(:user) }

  it "updates the precinct id and canvasser_password global variable" do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]" , with: user.password
    click_on "Log in"

    visit settings_path
    fill_in "precinct_id", with: "12345,67890"
    fill_in "canvasser_password", with: "password"
    click_on "update"
  end

  it "deletes all the visit records" do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]" , with: user.password
    click_on "Log in"

    visit settings_path
    click_on "Reset Visited Records"
    expect(page).to have_content("All visit records deleted")
    expect(Visit.count).to eq 0
  end
end
