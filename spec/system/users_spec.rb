# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
    @user = FactoryBot.build(:user)
  end

  scenario 'successfully signs up and redirect to root path' do
    visit new_user_path
    click_link 'Sign up'

    expect do
      fill_in 'Name', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password Confirmation', with: @user.password_confirmation
      click_button 'Sign up'
    end.to change(User, :count).by(1)

    expect(page).to have_content 'Successfully signed in!'
    expect(current_path).to eq root_path
  end

  scenario 'fail signs up with invalid information and redirect to new user path' do
    visit new_user_path
    click_link 'Sign up'

    expect do
      fill_in 'Name', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password Confirmation', with: 'barbaz'
      click_button 'Sign up'
    end.to change(User, :count).by(0)
  end
end
