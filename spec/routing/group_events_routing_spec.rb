require 'rails_helper'

RSpec.describe Api::V1::GroupEventsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/group_events').to route_to('api/v1/group_events#index')
    end

    it 'routes to #show' do
      expect(get: '/v1/group_events/1').to route_to('api/v1/group_events#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/v1/group_events').to route_to('api/v1/group_events#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/group_events/1').to route_to('api/v1/group_events#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/v1/group_events/1').to route_to('api/v1/group_events#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/v1/group_events/1').to route_to('api/v1/group_events#destroy', id: '1')
    end

    it 'routes to #publish' do
      expect(put: '/v1/group_events/1/publish').to route_to('api/v1/group_events#publish', id: '1')
    end
  end
end
