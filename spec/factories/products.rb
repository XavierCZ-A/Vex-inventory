FactoryBot.define do
  factory :product do
    name { "Default Product" }
    description { "Test" }
    price { 10.0 }
    sequence(:sku) { |n| "SKU-#{n}" }
    category
    organization
  end
end
