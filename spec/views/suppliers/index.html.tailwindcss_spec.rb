require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        company_name: "Company Name",
        supplier_name: "Supplier Name",
        supplier_phone: "Supplier Phone",
        supplier_email: "Supplier Email",
        supplier_address: "Supplier Address",
        notes: "MyText"
      ),
      Supplier.create!(
        company_name: "Company Name",
        supplier_name: "Supplier Name",
        supplier_phone: "Supplier Phone",
        supplier_email: "Supplier Email",
        supplier_address: "Supplier Address",
        notes: "MyText"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Company Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Supplier Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Supplier Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Supplier Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Supplier Address".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
