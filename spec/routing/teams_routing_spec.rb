require "rails_helper"

RSpec.describe TeamsController, type: :routing do
  let(:gaming_group) { create(:gaming_group) }
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gaming_groups/#{gaming_group.id}/teams").to route_to("teams#index", gaming_group_id: gaming_group.id)
    end

    it "routes to #new" do
      expect(get: "/gaming_groups/#{gaming_group.id}/teams/new").to route_to("teams#new", gaming_group_id: gaming_group.id)
    end

    it "routes to #show" do
      expect(get: "/gaming_groups/#{gaming_group.id}/teams/1").to route_to("teams#show", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #edit" do
      expect(get: "/gaming_groups/#{gaming_group.id}/teams/1/edit").to route_to("teams#edit", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #create" do
      expect(post: "/gaming_groups/#{gaming_group.id}/teams").to route_to("teams#create", gaming_group_id: gaming_group.id)
    end

    it "routes to #update via PUT" do
      expect(put: "/gaming_groups/#{gaming_group.id}/teams/1").to route_to("teams#update", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gaming_groups/#{gaming_group.id}/teams/1").to route_to("teams#update", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #destroy" do
      expect(delete: "/gaming_groups/#{gaming_group.id}/teams/1").to route_to("teams#destroy", id: "1", gaming_group_id: gaming_group.id)
    end
  end
end
