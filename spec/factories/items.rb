# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { 'test1' }
    price { 12 }
    stock { 10 }
  end
end

