require 'rails_helper'

RSpec.describe "organizations/show", type: :view do
  before(:each) do
    assign(:organization, Organization.create!(
      name: "Name",
      email: "Email",
      password: "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
  end
end
