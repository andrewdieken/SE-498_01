require "rails_helper"

RSpec.describe "Settings page", type: :feature do
  let(:voter) { create(:voter) }
  let(:visit1) { create(:visit, voter_id: voter.id) }

  it "updates the precinct id and canvasser_password global variable" do
    visit settings_path
    fill_in "precinct_id", with: "12345,67890"
    fill_in "canvasser_password", with: "password"
    click_on "update"
    expect(page).to have_selector("textarea", :text => "12345,67890")
  end

  it "deletes all the visit records" do
    visit settings_path
    click_on "Reset Visited Records"
    expect(page).to have_content("All visit records deleted")
    expect(Visit.count).to eq 0
  end

end
