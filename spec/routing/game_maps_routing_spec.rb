require "rails_helper"

RSpec.describe GameMapsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/game_maps").to route_to("game_maps#index")
    end

    it "routes to #new" do
      expect(get: "/game_maps/new").to route_to("game_maps#new")
    end

    it "routes to #show" do
      expect(get: "/game_maps/1").to route_to("game_maps#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/game_maps/1/edit").to route_to("game_maps#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/game_maps").to route_to("game_maps#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/game_maps/1").to route_to("game_maps#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/game_maps/1").to route_to("game_maps#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/game_maps/1").to route_to("game_maps#destroy", id: "1")
    end
  end
end
