FactoryBot.define do
  factory :order do
    order_date { "2025-03-29" }
    order_number { "MyString" }
    notes { "MyText" }
    status { 1 }
    payment_term { nil }
    supplier { nil }
  end
end
