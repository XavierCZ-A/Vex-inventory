FactoryBot.define do
  factory :supplier do
    company_name { "MyString" }
    supplier_name { "MyString" }
    supplier_phone { "MyString" }
    sequence(:supplier_email) { |n| "user#{n}@example.com" }
    supplier_address { "MyString" }
    notes { "MyText" }
    organization
  end
end
