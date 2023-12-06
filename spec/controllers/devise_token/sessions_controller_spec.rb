# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeviseToken::SessionsController do
  let(:user) { create(:user) }
  let(:devise_mapping) { Devise.mappings[:user] }

  before do
    request.env['devise.mapping'] = devise_mapping
  end

  describe 'POST #create' do
    before { post :create, params: { email: user.email, password: user.password } }

    context 'with valid credentials' do
      it 'returns a success response with the user data' do
        expect(user).to have_attributes(
          id: user.id,
          name: user.name,
          email: user.email
        )
      end

      it 'returns a success with a Bearer token' do
        expect(response).to have_http_status(:ok)
        expect(response.headers).to have_key('Authorization')

        parsed_response = JSON.parse(response.body)
        expect(parsed_response['data']).to include('Authorization' => a_string_starting_with('Bearer'))
      end

      it 'returns the same token in both the body and the header' do
        header_token = response.headers['Authorization']
        parsed_response = JSON.parse(response.body)
        body_token = parsed_response['data']['Authorization']
        expect(header_token).to eq(body_token)
      end
    end

    context 'with invalid credentials' do
      it 'returns an error response' do
        post :create, params: { email: 'invalid@example.com', password: 'invalid_password' }

        expect(response).to have_http_status(:unauthorized)
        expect(response.headers).not_to have_key('Authorization')

        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors']).to include('Invalid login credentials. Please try again.')
      end
    end
  end
end
