# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { 'Test' }
    sequence(:email) { |n| "test#{n}@example.com" }
    address { '1234 Abc Street' }
  end
end

