require "rails_helper"

RSpec.describe CampaignsController, type: :routing do
  let(:gaming_group) { create(:gaming_group) }
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gaming_groups/#{gaming_group.id}/campaigns").to route_to("campaigns#index", gaming_group_id: gaming_group.id)
    end

    it "routes to #new" do
      expect(get: "/gaming_groups/#{gaming_group.id}/campaigns/new").to route_to("campaigns#new", gaming_group_id: gaming_group.id)
    end

    it "routes to #show" do
      expect(get: "/gaming_groups/#{gaming_group.id}/campaigns/1").to route_to("campaigns#show", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #edit" do
      expect(get: "/gaming_groups/#{gaming_group.id}/campaigns/1/edit").to route_to("campaigns#edit", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #create" do
      expect(post: "/gaming_groups/#{gaming_group.id}/campaigns").to route_to("campaigns#create", gaming_group_id: gaming_group.id)
    end

    it "routes to #update via PUT" do
      expect(put: "/gaming_groups/#{gaming_group.id}/campaigns/1").to route_to("campaigns#update", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gaming_groups/#{gaming_group.id}/campaigns/1").to route_to("campaigns#update", id: "1", gaming_group_id: gaming_group.id)
    end

    it "routes to #destroy" do
      expect(delete: "/gaming_groups/#{gaming_group.id}/campaigns/1").to route_to("campaigns#destroy", id: "1", gaming_group_id: gaming_group.id)
    end
  end
end
