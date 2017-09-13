require 'rails_helper'

RSpec.describe Api::V1::GroupEventsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # GroupEvent. As you add validations to GroupEvent, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for(:group_event) }
  let(:invalid_attributes) { attributes_for(:group_event).except(:starts_at) }
  let(:group_event) { create(:group_event) }
  let(:incomplete_group_event) { create(:group_event, :incomplete) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: group_event.id }
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new GroupEvent' do
        expect {
          post :create, params: { group_event: valid_attributes }
        }.to change(GroupEvent, :count).by(1)
      end

      it 'renders a JSON response with the new draft group_event' do
        post :create, params: { group_event: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with incomplete/invalid params' do
      it 'renders a JSON response with the new group_event' do
        post :create, params: { group_event: invalid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {name: 'Updated Name', description: 'Updated Description'}
      }

      it 'updates the requested group_event' do
        put :update, params: { id: group_event.id, group_event: new_attributes }
        group_event.reload
        expect(group_event).to have_attributes(name: 'Updated Name', description: 'Updated Description')
      end

      it 'renders a JSON response with the group_event' do
        put :update, params: { id: group_event.id, group_event: new_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with inclompete/invalid params' do
      it 'renders a JSON response with the group_event' do
        put :update, params: { id: group_event.id, group_event: invalid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested group_event without deleting the record' do
      expect {
        delete :destroy, params: { id: group_event.id }
      }.to_not change(GroupEvent, :count)
    end
    it 'marks record as deleted' do
      expect {
        delete :destroy, params: { id: group_event.id }
        group_event.reload
      }.to change(group_event, :deleted_at).from(nil)
    end
  end

  describe 'PUT #publish' do
    context 'with valid params' do
      it 'marks group_event as published' do
        expect {
          put :publish, params: { id: group_event.id }
          group_event.reload
        }.to change(group_event, :published).from(false).to(true)
      end
    end

    context 'with invalid/incomplete params' do
      it 'fails' do
        expect {
          put :publish, params: { id: incomplete_group_event.id }
          incomplete_group_event.reload
        }.to_not change(incomplete_group_event, :published)
      end
    end
  end
end
