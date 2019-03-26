require 'rails_helper'

RSpec.describe Api::V1::VisitsController, type: :controller do
  let(:voter) { create(:voter) }
  # let(:visit) { create(:visit, voter_id: 1) }

  describe '#create' do
    it 'should return a valid response' do
      post :create, :params => { :id => 1 }
      expect(response).to have_http_status(200)
    end

    it 'should return a failed response' do
      post :create, :params => { :id => -1 }
      expect(response).to have_http_status(422)
    end
  end

end
