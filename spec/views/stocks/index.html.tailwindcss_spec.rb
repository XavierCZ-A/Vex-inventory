require 'rails_helper'

RSpec.describe "stocks/index", type: :view do
  before(:each) do
    assign(:stocks, [
      Stock.create!(
        product: nil,
        warehouse: nil,
        quantity: 2
      ),
      Stock.create!(
        product: nil,
        warehouse: nil,
        quantity: 2
      )
    ])
  end

  it "renders a list of stocks" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
