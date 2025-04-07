FactoryBot.define do
  factory :customer do
    name { "Test Customer" }
    email { "test@example.com" }
    phone { "1234567890" }
    company_name { "Test Company" }
    address { "123 Main St, Anytown, USA" }
    organization
  end
end
