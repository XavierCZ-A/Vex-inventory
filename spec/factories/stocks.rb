FactoryBot.define do
  factory :stock do
    product { nil }
    warehouse { nil }
    quantity { 1 }
    entry_date { "2025-03-27" }
  end
end
