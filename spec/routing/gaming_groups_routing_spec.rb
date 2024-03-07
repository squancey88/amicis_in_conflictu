require "rails_helper"

RSpec.describe GamingGroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gaming_groups").to route_to("gaming_groups#index")
    end

    it "routes to #new" do
      expect(get: "/gaming_groups/new").to route_to("gaming_groups#new")
    end

    it "routes to #show" do
      expect(get: "/gaming_groups/1").to route_to("gaming_groups#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/gaming_groups/1/edit").to route_to("gaming_groups#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/gaming_groups").to route_to("gaming_groups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gaming_groups/1").to route_to("gaming_groups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gaming_groups/1").to route_to("gaming_groups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gaming_groups/1").to route_to("gaming_groups#destroy", id: "1")
    end
  end
end
