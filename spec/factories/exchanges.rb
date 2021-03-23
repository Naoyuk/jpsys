FactoryBot.define do
  factory :jpy, class: Exchange do
    currency { "JPY" }
    rate { 1.5 }
  end

  factory :cad, class: Exchange do
    currency { "CAD" }
    rate { 1.2 }
  end
end
