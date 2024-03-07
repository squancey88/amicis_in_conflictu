require "rails_helper"

RSpec.describe GamingSessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gaming_sessions").to route_to("gaming_sessions#index")
    end

    it "routes to #new" do
      expect(get: "/gaming_sessions/new").to route_to("gaming_sessions#new")
    end

    it "routes to #show" do
      expect(get: "/gaming_sessions/1").to route_to("gaming_sessions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/gaming_sessions/1/edit").to route_to("gaming_sessions#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/gaming_sessions").to route_to("gaming_sessions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gaming_sessions/1").to route_to("gaming_sessions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gaming_sessions/1").to route_to("gaming_sessions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gaming_sessions/1").to route_to("gaming_sessions#destroy", id: "1")
    end
  end
end
