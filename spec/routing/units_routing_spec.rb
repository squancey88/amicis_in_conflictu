require "rails_helper"

RSpec.describe UnitsController, type: :routing do
  let(:army_list) { create(:army_list) }
  describe "routing" do
    it "routes to #index" do
      expect(get: "/army_lists/#{army_list.id}/units").to route_to("units#index", army_list_id: army_list.id)
    end

    it "routes to #new" do
      expect(get: "/army_lists/#{army_list.id}/units/new").to route_to("units#new", army_list_id: army_list.id)
    end

    it "routes to #show" do
      expect(get: "/army_lists/#{army_list.id}/units/1").to route_to("units#show", id: "1", army_list_id: army_list.id)
    end

    it "routes to #edit" do
      expect(get: "/army_lists/#{army_list.id}/units/1/edit").to route_to("units#edit", id: "1", army_list_id: army_list.id)
    end

    it "routes to #create" do
      expect(post: "/army_lists/#{army_list.id}/units").to route_to("units#create", army_list_id: army_list.id)
    end

    it "routes to #update via PUT" do
      expect(put: "/army_lists/#{army_list.id}/units/1").to route_to("units#update", id: "1", army_list_id: army_list.id)
    end

    it "routes to #update via PATCH" do
      expect(patch: "/army_lists/#{army_list.id}/units/1").to route_to("units#update", id: "1", army_list_id: army_list.id)
    end

    it "routes to #destroy" do
      expect(delete: "/army_lists/#{army_list.id}/units/1").to route_to("units#destroy", id: "1", army_list_id: army_list.id)
    end
  end
end
