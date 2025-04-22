require "rails_helper"

RSpec.describe StockMovementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stock_movements").to route_to("stock_movements#index")
    end

    it "routes to #new" do
      expect(get: "/stock_movements/new").to route_to("stock_movements#new")
    end

    it "routes to #create" do
      expect(post: "/stock_movements").to route_to("stock_movements#create")
    end
  end
end
