FactoryBot.define do
  factory :payment_term do
    name { "MyString" }
    days { 1 }
    description { "MyText" }
    active { false }
  end
end
