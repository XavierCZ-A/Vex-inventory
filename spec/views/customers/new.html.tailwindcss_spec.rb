require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, Customer.new(
      name: "MyString",
      email: "MyString",
      phone: "MyString",
      company_name: "MyString",
      address: "MyString"
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input[name=?]", "customer[name]"

      assert_select "input[name=?]", "customer[email]"

      assert_select "input[name=?]", "customer[phone]"

      assert_select "input[name=?]", "customer[company_name]"

      assert_select "input[name=?]", "customer[address]"
    end
  end
end
