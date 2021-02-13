FactoryBot.define do
  factory :user do
    name { "Naoyuki" }
    email { "naoyuki@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end
