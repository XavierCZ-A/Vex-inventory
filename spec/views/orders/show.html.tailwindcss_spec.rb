require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    assign(:order, Order.create!(
      order_number: "Order Number",
      notes: "MyText",
      status: 2,
      payment_term: nil,
      supplier: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Order Number/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
