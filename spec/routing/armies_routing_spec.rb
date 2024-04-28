require "rails_helper"

RSpec.describe ArmiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/armies").to route_to("armies#index")
    end

    it "routes to #new" do
      expect(get: "/armies/new").to route_to("armies#new")
    end

    it "routes to #show" do
      expect(get: "/armies/1").to route_to("armies#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/armies/1/edit").to route_to("armies#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/armies").to route_to("armies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/armies/1").to route_to("armies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/armies/1").to route_to("armies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/armies/1").to route_to("armies#destroy", id: "1")
    end
  end
end
