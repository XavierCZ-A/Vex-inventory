require 'rails_helper'

RSpec.describe "warehouses/show", type: :view do
  before(:each) do
    assign(:warehouse, Warehouse.create!(
      name: "Name",
      address: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
