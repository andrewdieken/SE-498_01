require 'rails_helper'

RSpec.describe SettingsController, type: :controller do

  describe '#index' do
    it 'should get the precinctid value as an array' do
      get :index
      expect(Setting['precinct_id']).to be_an_instance_of(Array)
    end
  end

end
