# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { "pablo" }
    last_name { "moreno" }
    email_address { "email@example.com" }
    password { 'SecretPassword' }
    organization
  end
end
