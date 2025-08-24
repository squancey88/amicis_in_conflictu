require "rails_helper"

RSpec.describe OrganisationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/worlds/1/organisations").to route_to("organisations#index", world_id: "1")
    end

    it "routes to #new" do
      expect(get: "/worlds/1/organisations/new").to route_to("organisations#new", world_id: "1")
    end

    it "routes to #show" do
      expect(get: "/worlds/1/organisations/1").to route_to("organisations#show", world_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/worlds/1/organisations/1/edit").to route_to("organisations#edit", world_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post: "/worlds/1/organisations").to route_to("organisations#create", world_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/worlds/1/organisations/1").to route_to("organisations#update", world_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/worlds/1/organisations/1").to route_to("organisations#update", world_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/worlds/1/organisations/1").to route_to("organisations#destroy", world_id: "1", id: "1")
    end
  end
end
