require "rails_helper"

RSpec.describe QuestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/worlds/2/quests").to route_to("quests#index", world_id: "2")
    end

    it "routes to #new" do
      expect(get: "/worlds/2/quests/new").to route_to("quests#new", world_id: "2")
    end

    it "routes to #show" do
      expect(get: "/worlds/2/quests/1").to route_to("quests#show", id: "1", world_id: "2")
    end

    it "routes to #edit" do
      expect(get: "/worlds/2/quests/1/edit").to route_to("quests#edit", id: "1", world_id: "2")
    end

    it "routes to #create" do
      expect(post: "/worlds/2/quests").to route_to("quests#create", world_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/worlds/2/quests/1").to route_to("quests#update", id: "1", world_id: "2")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/worlds/2/quests/1").to route_to("quests#update", id: "1", world_id: "2")
    end

    it "routes to #destroy" do
      expect(delete: "/worlds/2/quests/1").to route_to("quests#destroy", id: "1", world_id: "2")
    end
  end
end
