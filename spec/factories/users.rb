# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Test' }
    email { 'test@example.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end
