# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :system do
  before do
    driven_by(:rack_test)
    visit '/login'
    @user = FactoryBot.create(:user)
    @customer = FactoryBot.create(:customer)
    @item = FactoryBot.create(:item)
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  scenario "creates a new order with new lists at the same time" do
    expect do
      visit new_order_path
      select 'Test', from: 'order_customer_id'
      fill_in 'order_payment_date', with: Date.today
      select 'test1', from: 'order[lists_attributes][0][item_id]'
      fill_in 'order[lists_attributes][0][amount]', with: 1
      fill_in 'order[lists_attributes][0][discount]', with: 5
      click_button 'Save'
    end.to change(List, :count).by(1)
  end



end
