require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "successfully signs up and got email and redirect to root path" do

    visit new_user_path
    click_link "Sign up"

    expect {
      fill_in "Name", with: "test"
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "foobar"
      fill_in "Password Confirmation", with: "foobar"
      click_button "Sign up"
    }.to change(User, :count).by(1)

  end

  scenario "fail signs up with invalid information and redirect to new user path" do

    visit new_user_path
    click_link "Sign up"

    expect {
      fill_in "Name", with: "test"
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "foobar"
      fill_in "Password Confirmation", with: "barbaz"
      click_button "Sign up"
    }.to change(User, :count).by(0)

  end
end
