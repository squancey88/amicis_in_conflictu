require "rails_helper"

RSpec.describe GameSystemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/game_systems").to route_to("game_systems#index")
    end

    it "routes to #new" do
      expect(get: "/game_systems/new").to route_to("game_systems#new")
    end

    it "routes to #show" do
      expect(get: "/game_systems/1").to route_to("game_systems#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/game_systems/1/edit").to route_to("game_systems#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/game_systems").to route_to("game_systems#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/game_systems/1").to route_to("game_systems#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/game_systems/1").to route_to("game_systems#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/game_systems/1").to route_to("game_systems#destroy", id: "1")
    end
  end
end
