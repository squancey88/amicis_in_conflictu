require "rails_helper"

RSpec.describe LocationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/worlds/2/locations").to route_to("locations#index", world_id: "2")
    end

    it "routes to #new" do
      expect(get: "/worlds/2/locations/new").to route_to("locations#new", world_id: "2")
    end

    it "routes to #show" do
      expect(get: "/worlds/2/locations/1").to route_to("locations#show", id: "1", world_id: "2")
    end

    it "routes to #edit" do
      expect(get: "/worlds/2/locations/1/edit").to route_to("locations#edit", id: "1", world_id: "2")
    end

    it "routes to #create" do
      expect(post: "/worlds/2/locations").to route_to("locations#create", world_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/worlds/2/locations/1").to route_to("locations#update", id: "1", world_id: "2")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/worlds/2/locations/1").to route_to("locations#update", id: "1", world_id: "2")
    end

    it "routes to #destroy" do
      expect(delete: "/worlds/2/locations/1").to route_to("locations#destroy", id: "1", world_id: "2")
    end
  end
end
