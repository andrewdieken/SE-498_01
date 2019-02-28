require 'rails_helper'

RSpec.describe Api::V1::VotersController, type: :controller do
  let(:voter) { create(:voter) }

  it 'should be valid' do
    expect(voter).to be_valid
  end

  it 'should contain voterID' do
    expect(voter.voterID).to eq(1)
  end


  describe '#index' do
    it 'should return a response' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'should return a json object ' do
      get :index
      parsed_body = JSON.parse(response.body)
      expect ( '{:meta {:total_pages,:previous_page,:next_page},:status, :message, :data}, :status')
    end

    it 'should check the voter data is not null' do
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']).to_not be_nil
    end

    it 'should return voter' do
      get :index
      parsed_body = JSON.parse(response.body)
    end

    it 'should return voter data' do
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["data"][0]["last_name"]).to eq("Aaby")
    end
  end

  describe '#show' do
    it 'should return the voter object' do
      get :show, params: {id:voter.id}
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["data"]).to_not be_nil
      expect ( '{:status, :message, :data}')
    end
  end
end
