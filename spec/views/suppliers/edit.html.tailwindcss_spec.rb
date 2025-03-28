require 'rails_helper'

RSpec.describe "suppliers/edit", type: :view do
  let(:supplier) {
    Supplier.create!(
      company_name: "MyString",
      supplier_name: "MyString",
      supplier_phone: "MyString",
      supplier_email: "MyString",
      supplier_address: "MyString",
      notes: "MyText"
    )
  }

  before(:each) do
    assign(:supplier, supplier)
  end

  it "renders the edit supplier form" do
    render

    assert_select "form[action=?][method=?]", supplier_path(supplier), "post" do

      assert_select "input[name=?]", "supplier[company_name]"

      assert_select "input[name=?]", "supplier[supplier_name]"

      assert_select "input[name=?]", "supplier[supplier_phone]"

      assert_select "input[name=?]", "supplier[supplier_email]"

      assert_select "input[name=?]", "supplier[supplier_address]"

      assert_select "textarea[name=?]", "supplier[notes]"
    end
  end
end
