require 'rails_helper'

RSpec.describe "suppliers/new", type: :view do
  before(:each) do
    assign(:supplier, Supplier.new(
      company_name: "MyString",
      supplier_name: "MyString",
      supplier_phone: "MyString",
      supplier_email: "MyString",
      supplier_address: "MyString",
      notes: "MyText"
    ))
  end

  it "renders new supplier form" do
    render

    assert_select "form[action=?][method=?]", suppliers_path, "post" do

      assert_select "input[name=?]", "supplier[company_name]"

      assert_select "input[name=?]", "supplier[supplier_name]"

      assert_select "input[name=?]", "supplier[supplier_phone]"

      assert_select "input[name=?]", "supplier[supplier_email]"

      assert_select "input[name=?]", "supplier[supplier_address]"

      assert_select "textarea[name=?]", "supplier[notes]"
    end
  end
end
