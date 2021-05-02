FactoryBot.define do
  factory :line do
    purchase_id { 1 }
    title { "MyString" }
    price { 15 }
    quantity { 1 }
    discount { 1 }
  end
end
