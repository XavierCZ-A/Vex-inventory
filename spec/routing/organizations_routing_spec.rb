require "rails_helper"

RSpec.describe OrganizationsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/organizations/new").to route_to("organizations#new")
    end

    it "routes to #create" do
      expect(post: "/organizations").to route_to("organizations#create")
    end
  end
end
