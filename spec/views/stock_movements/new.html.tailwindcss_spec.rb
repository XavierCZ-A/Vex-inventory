require 'rails_helper'

RSpec.describe "stock_movements/new", type: :view do
  before(:each) do
    assign(:stock_movement, StockMovement.new(
      product: nil,
      warehouse: nil,
      quantity_change: 1,
      notes: "MyText",
      user: nil
    ))
  end

  it "renders new stock_movement form" do
    render

    assert_select "form[action=?][method=?]", stock_movements_path, "post" do

      assert_select "input[name=?]", "stock_movement[product_id]"

      assert_select "input[name=?]", "stock_movement[warehouse_id]"

      assert_select "input[name=?]", "stock_movement[quantity_change]"

      assert_select "textarea[name=?]", "stock_movement[notes]"

      assert_select "input[name=?]", "stock_movement[user_id]"
    end
  end
end
