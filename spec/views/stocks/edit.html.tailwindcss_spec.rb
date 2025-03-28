require 'rails_helper'

RSpec.describe "stocks/edit", type: :view do
  let(:stock) {
    Stock.create!(
      product: nil,
      warehouse: nil,
      quantity: 1
    )
  }

  before(:each) do
    assign(:stock, stock)
  end

  it "renders the edit stock form" do
    render

    assert_select "form[action=?][method=?]", stock_path(stock), "post" do

      assert_select "input[name=?]", "stock[product_id]"

      assert_select "input[name=?]", "stock[warehouse_id]"

      assert_select "input[name=?]", "stock[quantity]"
    end
  end
end
