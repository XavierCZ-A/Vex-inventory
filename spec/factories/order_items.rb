FactoryBot.define do
  factory :order_item do
    quantity { 1 }
    price { BigDecimal('10.0') }
    total_amount { "9.99" }
    product
    order
    organization
  end
end
