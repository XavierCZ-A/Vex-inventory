require 'rails_helper'

RSpec.describe "stock_movements/edit", type: :view do
  let(:stock_movement) {
    StockMovement.create!(
      product: nil,
      warehouse: nil,
      quantity_change: 1,
      notes: "MyText",
      user: nil
    )
  }

  before(:each) do
    assign(:stock_movement, stock_movement)
  end

  it "renders the edit stock_movement form" do
    render

    assert_select "form[action=?][method=?]", stock_movement_path(stock_movement), "post" do

      assert_select "input[name=?]", "stock_movement[product_id]"

      assert_select "input[name=?]", "stock_movement[warehouse_id]"

      assert_select "input[name=?]", "stock_movement[quantity_change]"

      assert_select "textarea[name=?]", "stock_movement[notes]"

      assert_select "input[name=?]", "stock_movement[user_id]"
    end
  end
end
