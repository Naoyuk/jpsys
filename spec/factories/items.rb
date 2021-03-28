# frozen_string_literal: true

FactoryBot.define do
  factory :item1, class: Item do
    name { 'test1' }
    price { 12 }
    stock { 10 }
  end

  factory :item2, class: Item do
    name { 'test2' }
    price { 20 }
    stock { 15 }
  end
end

