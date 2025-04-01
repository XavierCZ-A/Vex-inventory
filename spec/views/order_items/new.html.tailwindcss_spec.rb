require 'rails_helper'

RSpec.describe "order_items/new", type: :view do
  before(:each) do
    assign(:order_item, OrderItem.new(
      quantity: 1,
      price: "9.99",
      total_amount: "9.99",
      order: nil,
      product: nil
    ))
  end

  it "renders new order_item form" do
    render

    assert_select "form[action=?][method=?]", order_items_path, "post" do

      assert_select "input[name=?]", "order_item[quantity]"

      assert_select "input[name=?]", "order_item[price]"

      assert_select "input[name=?]", "order_item[total_amount]"

      assert_select "input[name=?]", "order_item[order_id]"

      assert_select "input[name=?]", "order_item[product_id]"
    end
  end
end
