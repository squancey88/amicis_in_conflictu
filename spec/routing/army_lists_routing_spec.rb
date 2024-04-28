require "rails_helper"

RSpec.describe ArmyListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/army_lists").to route_to("army_lists#index")
    end

    it "routes to #new" do
      expect(get: "/army_lists/new").to route_to("army_lists#new")
    end

    it "routes to #show" do
      expect(get: "/army_lists/1").to route_to("army_lists#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/army_lists/1/edit").to route_to("army_lists#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/army_lists").to route_to("army_lists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/army_lists/1").to route_to("army_lists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/army_lists/1").to route_to("army_lists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/army_lists/1").to route_to("army_lists#destroy", id: "1")
    end
  end
end
