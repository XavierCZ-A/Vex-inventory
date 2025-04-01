require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  let(:order) {
    Order.create!(
      order_number: "MyString",
      notes: "MyText",
      status: 1,
      payment_term: nil,
      supplier: nil
    )
  }

  before(:each) do
    assign(:order, order)
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(order), "post" do

      assert_select "input[name=?]", "order[order_number]"

      assert_select "textarea[name=?]", "order[notes]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[payment_term_id]"

      assert_select "input[name=?]", "order[supplier_id]"
    end
  end
end
