FactoryBot.define do
  factory :supplier do
    name { "test supplier" }
    representative { "test representative" }
    sequence(:email) { |n| "test#{n}@example.com" }
    address { "test address" }
  end
end

