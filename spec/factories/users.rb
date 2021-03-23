# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    name { 'Test' }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end

  factory :duplicated_user, class: User do
    name { 'Test' }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end
