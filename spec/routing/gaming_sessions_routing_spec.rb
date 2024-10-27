require "rails_helper"

RSpec.describe GamingSessionsController, type: :routing do
  let(:gaming_group) { create(:gaming_group) }
  describe "routing" do
    it "routes to #new" do
      expect(get: "/gaming_groups/#{gaming_group.id}/gaming_sessions/new").to route_to("gaming_sessions#new", gaming_group_id: gaming_group.id)
    end

    it "routes to #show" do
      expect(get: "/gaming_groups/#{gaming_group.id}/gaming_sessions/1").to route_to("gaming_sessions#show", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #edit" do
      expect(get: "/gaming_groups/#{gaming_group.id}/gaming_sessions/1/edit").to route_to("gaming_sessions#edit", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #create" do
      expect(post: "/gaming_groups/#{gaming_group.id}/gaming_sessions").to route_to("gaming_sessions#create", gaming_group_id: gaming_group.id)
    end

    it "routes to #update via PUT" do
      expect(put: "/gaming_groups/#{gaming_group.id}/gaming_sessions/1").to route_to("gaming_sessions#update", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gaming_groups/#{gaming_group.id}/gaming_sessions/1").to route_to("gaming_sessions#update", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #destroy" do
      expect(delete: "/gaming_groups/#{gaming_group.id}/gaming_sessions/1").to route_to("gaming_sessions#destroy", id: "1", gaming_group_id: gaming_group.id)
    end
  end
end
