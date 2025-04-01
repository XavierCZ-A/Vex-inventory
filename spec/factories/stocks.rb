FactoryBot.define do
  factory :stock do
    quantity { 1 }
    entry_date { "2025-03-27" }
    warehouse
    product
    organization
  end
end
