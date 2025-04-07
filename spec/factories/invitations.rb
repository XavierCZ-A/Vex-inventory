FactoryBot.define do
  factory :invitation do
    email { "xavier@example.com" }
    name { "Xavier" }
    recipient { association(:user) }
    organization
    status { 1 }
  end
end
