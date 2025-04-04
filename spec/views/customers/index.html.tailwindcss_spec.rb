require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        name: "Name",
        email: "Email",
        phone: "Phone",
        company_name: "Company Name",
        address: "Address"
      ),
      Customer.create!(
        name: "Name",
        email: "Email",
        phone: "Phone",
        company_name: "Company Name",
        address: "Address"
      )
    ])
  end

  it "renders a list of customers" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Company Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address".to_s), count: 2
  end
end
