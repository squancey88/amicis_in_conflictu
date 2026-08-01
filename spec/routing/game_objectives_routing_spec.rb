require "rails_helper"

RSpec.describe GameObjectivesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/game_objectives").to route_to("game_objectives#index")
    end

    it "routes to #new" do
      expect(get: "/game_objectives/new").to route_to("game_objectives#new")
    end

    it "routes to #show" do
      expect(get: "/game_objectives/1").to route_to("game_objectives#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/game_objectives/1/edit").to route_to("game_objectives#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/game_objectives").to route_to("game_objectives#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/game_objectives/1").to route_to("game_objectives#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/game_objectives/1").to route_to("game_objectives#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/game_objectives/1").to route_to("game_objectives#destroy", id: "1")
    end
  end
end
