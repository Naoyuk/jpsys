# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET /login' do
    it 'returns http success' do
      get '/login'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /login' do
    user = User.create(name: 'Login User', email: 'luser@example.com', password: 'password', password_confirmation: 'password')
    it 'log in and redirect to root page' do
      post login_path, params: {session: {email: user.email, password: user.password}}

      expect(response).to redirect_to root_path
      expect(is_logged_in?).to be_truthy
    end
  end
end
