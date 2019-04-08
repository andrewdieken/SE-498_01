require "rails_helper"

RSpec.describe "Settings page", type: :feature do

  it "updates the precinct id global variable" do
    visit settings_path
    fill_in "precinct_id", with: 12345
    click_on "Update"
    expect(page).to have_selector("input[value='12345']")
  end

end
