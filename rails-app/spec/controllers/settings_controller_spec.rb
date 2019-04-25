require 'rails_helper'

RSpec.describe SettingsController, type: :controller do
  describe '#index' do
    it 'should get the precinctid value as an array' do
      get :index
      expect(Setting['precinct_id']).to be_an_instance_of(Array)
    end
  end

  it "updates the precinct id and canvasser_password global variable" do
    visit settings_path
    fill_in "precinct_id", with: "12345,67890"
    fill_in "canvasser_password", with: "password"
    click_on "update"
    expect(page).to have_selector("textarea", :text => "12345,67890")
  end
end
