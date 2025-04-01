require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      order_number: "MyString",
      notes: "MyText",
      status: 1,
      payment_term: nil,
      supplier: nil
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[order_number]"

      assert_select "textarea[name=?]", "order[notes]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[payment_term_id]"

      assert_select "input[name=?]", "order[supplier_id]"
    end
  end
end
