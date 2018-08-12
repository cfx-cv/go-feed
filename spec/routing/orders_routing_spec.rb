require "rails_helper"

RSpec.describe OrdersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "app/orders").to route_to("orders#index")
    end

    it "routes to #show" do
      expect(get: "app/orders/1").to route_to("orders#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "app/orders").to route_to("orders#create")
    end

    it "routes to #update via PUT" do
      expect(put: "app/orders/1").to route_to("orders#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "app/orders/1").to route_to("orders#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "app/orders/1").to route_to("orders#destroy", id: "1")
    end
  end
end
