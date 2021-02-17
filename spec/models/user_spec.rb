# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'has a valid factory' do
    expect(@user).to be_valid
  end

  it 'is invalid without a name' do
    @user.name = nil
    @user.valid?
    expect(@user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an email' do
    @user.email = '   '
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email address' do
    FactoryBot.create(:user, email: 'test@example.com')
    @user.email = 'test@example.com'
    @user.valid?
    expect(@user.errors[:email]).to include('has already been taken')
  end

  it 'is invalid with a same but upcase or downcase' do
    @user.email = 'Test@eXamPLe.CoM'
    @user.save
    expect(@user.email).to eq 'test@example.com'
  end

  it 'is valid with a valid email address' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US_ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it 'is invalid with an invalid email address' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com
                           foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to_not be_valid
    end
  end

  it 'is invalid without a password' do
    @user.password = @user.password_confirmation = nil
    expect(@user).to_not be_valid
  end

  it 'is invalid with a password blank' do
    @user.password = @user.password_confirmation = ' ' * 6
    expect(@user).to_not be_valid
  end

  it 'is invalid with a password less than 6 letters' do
    @user.password = @user.password_confirmation = 'a' * 5
    expect(@user).to_not be_valid
  end

  it 'is valid with a password 6 letters' do
    @user.password = @user.password_confirmation = 'a' * 6
    expect(@user).to be_valid
  end

  it 'is valid with a password more than 6 letters' do
    @user.password = @user.password_confirmation = 'a' * 7
    expect(@user).to be_valid
  end
end
