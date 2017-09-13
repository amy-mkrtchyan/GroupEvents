require 'rails_helper'

RSpec.describe 'GroupEvents', type: :request do
  describe 'GET /v1/group_events' do
    it 'works! (now write some real specs)' do
      get v1_group_events_url
      expect(response).to have_http_status(200)
    end
  end
end
