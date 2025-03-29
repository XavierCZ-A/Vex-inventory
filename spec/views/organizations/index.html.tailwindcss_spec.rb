require 'rails_helper'

RSpec.describe "organizations/index", type: :view do
  before(:each) do
    assign(:organizations, [
      Organization.create!(
        name: "Name",
        email: "Email",
        password: "Password"
      ),
      Organization.create!(
        name: "Name",
        email: "Email",
        password: "Password"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Password".to_s), count: 2
  end
end
