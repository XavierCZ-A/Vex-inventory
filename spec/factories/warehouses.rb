FactoryBot.define do
  factory :warehouse do
    name { "Test Warehouse" }
    address { "123 Test St" }
    capacity { 100 }
    organization
  end
end
