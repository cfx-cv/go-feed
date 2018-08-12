require "rails_helper"

RSpec.describe MenusController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "app/menus").to route_to("menus#index")
    end

    it "routes to #new" do
      expect(get: "app/menus/new").to route_to("menus#new")
    end

    it "routes to #show" do
      expect(get: "app/menus/1").to route_to("menus#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "app/menus/1/edit").to route_to("menus#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "app/menus").to route_to("menus#create")
    end

    it "routes to #update via PUT" do
      expect(put: "app/menus/1").to route_to("menus#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "app/menus/1").to route_to("menus#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "app/menus/1").to route_to("menus#destroy", id: "1")
    end
  end
end
