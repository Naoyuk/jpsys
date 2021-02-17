# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  before do
    driven_by(:rack_test)
    visit '/login'
    @user = FactoryBot.create(:user)
  end

  describe 'enter valid values' do
    before do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    subject { page }

    it 'log in with valid email address and password' do
      expect(page).to have_content 'Successfully logged in!'
      expect(page).to have_current_path root_path
    end
  end

  describe 'enter an invalid email address' do
    before do
      fill_in 'Email', with: 'test@invalid'
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    subject { page }

    it 'log in with invalid email address' do
      expect(page).to have_content 'Invalid email/password combination'
      expect(page).to have_current_path '/login'
    end
  end

  describe 'enter an invalid password' do
    before do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'foo'
      click_button 'Log in'
    end

    subject { page }

    it 'log in with invalid password' do
      expect(page).to have_content 'Invalid email/password combination'
      expect(page).to have_current_path '/login'
    end
  end
end
