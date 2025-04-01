FactoryBot.define do
  factory :supplier do
    company_name { "MyString" }
    supplier_name { "MyString" }
    supplier_phone { "MyString" }
    supplier_email { "email@example.com" }
    supplier_address { "MyString" }
    notes { "MyText" }
    organization
  end
end
