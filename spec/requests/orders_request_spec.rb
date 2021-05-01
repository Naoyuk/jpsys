# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'GET /orders' do
    context 'when you are not logged in' do
        it 'returns http error' do
          get '/orders'
          expect(response).to have_http_status(302)
        end
    end
  end
end
