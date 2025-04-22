FactoryBot.define do
  factory :stock_movement do
    product
    warehouse
    quantity_change { 1 }
    movement_date { Date.today }
    notes { "MyText" }
    user
    organization
    movement_type { :initial }
  end
end
