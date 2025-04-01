FactoryBot.define do
  factory :product do
    name { "Default Product" }
    description { "Test" }
    price { 10.0 }
    category
    organization
  end
end
