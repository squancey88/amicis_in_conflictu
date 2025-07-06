require "rails_helper"

RSpec.describe TimePeriodsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/worlds/2/time_periods").to route_to("time_periods#index", world_id: "2")
    end

    it "routes to #new" do
      expect(get: "/worlds/2/time_periods/new").to route_to("time_periods#new", world_id: "2")
    end

    it "routes to #show" do
      expect(get: "/worlds/2/time_periods/1").to route_to("time_periods#show", id: "1", world_id: "2")
    end

    it "routes to #edit" do
      expect(get: "/worlds/2/time_periods/1/edit").to route_to("time_periods#edit", id: "1", world_id: "2")
    end

    it "routes to #create" do
      expect(post: "/worlds/2/time_periods").to route_to("time_periods#create", world_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/worlds/2/time_periods/1").to route_to("time_periods#update", id: "1", world_id: "2")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/worlds/2/time_periods/1").to route_to("time_periods#update", id: "1", world_id: "2")
    end

    it "routes to #destroy" do
      expect(delete: "/worlds/2/time_periods/1").to route_to("time_periods#destroy", id: "1", world_id: "2")
    end
  end
end
