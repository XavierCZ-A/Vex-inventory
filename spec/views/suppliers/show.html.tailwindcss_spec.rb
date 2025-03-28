require 'rails_helper'

RSpec.describe "suppliers/show", type: :view do
  before(:each) do
    assign(:supplier, Supplier.create!(
      company_name: "Company Name",
      supplier_name: "Supplier Name",
      supplier_phone: "Supplier Phone",
      supplier_email: "Supplier Email",
      supplier_address: "Supplier Address",
      notes: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Supplier Name/)
    expect(rendered).to match(/Supplier Phone/)
    expect(rendered).to match(/Supplier Email/)
    expect(rendered).to match(/Supplier Address/)
    expect(rendered).to match(/MyText/)
  end
end
