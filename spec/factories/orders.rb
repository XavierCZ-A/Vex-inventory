FactoryBot.define do
  factory :order do
    order_date { "2025-03-29" }
    order_number { "MyString" }
    notes { "MyText" }
    delivery_date { Date.today + 7.days }
    supplier
    payment_term
    organization
    status { :pending }
  end
end
