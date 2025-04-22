FactoryBot.define do
  factory :stock do
    quantity { 1 }
    entry_date { Date.today }
    warehouse
    product
    organization
  end
end
