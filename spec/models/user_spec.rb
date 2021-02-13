require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank") 
  end

  it "is invalid without an email" do
    user = FactoryBot.build(:user, email: "   ")
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address(doesn't matter lower case and upper case" do
    FactoryBot.create(:user, email: 'test@example.com')
    user = FactoryBot.build(:user, email: 'test@example.com'.upcase)
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "is valid with a valid email address" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US_ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user = FactoryBot.build(:user, email: valid_address)
      expect(user).to be_valid
    end
  end

  it "is invalid with an invalid email address" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      user = FactoryBot.build(:user, email: invalid_address)
      expect(user).to_not be_valid
    end
  end

end
