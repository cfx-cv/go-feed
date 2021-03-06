require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "app/users").to route_to("users#index")
    end

    it "routes to #new" do
      expect(get: "register/customer").to route_to("users#new", role: "customer")
    end

    it "routes to #show" do
      expect(get: "app/users/1").to route_to("users#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "app/users/1/edit").to route_to("users#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "register/customer").to route_to("users#create", role: "customer")
    end

    it "routes to #update via PUT" do
      expect(put: "app/users/1").to route_to("users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "app/users/1").to route_to("users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "app/users/1").to route_to("users#destroy", id: "1")
    end
  end
end
