FactoryBot.define do
  factory :stock do
    quantity { 1 }
    warehouse
    product
    organization
  end
end
