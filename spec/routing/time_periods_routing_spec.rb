require "rails_helper"

RSpec.describe TimePeriodsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/time_periods").to route_to("time_periods#index")
    end

    it "routes to #new" do
      expect(get: "/time_periods/new").to route_to("time_periods#new")
    end

    it "routes to #show" do
      expect(get: "/time_periods/1").to route_to("time_periods#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/time_periods/1/edit").to route_to("time_periods#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/time_periods").to route_to("time_periods#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/time_periods/1").to route_to("time_periods#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/time_periods/1").to route_to("time_periods#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/time_periods/1").to route_to("time_periods#destroy", id: "1")
    end
  end
end
