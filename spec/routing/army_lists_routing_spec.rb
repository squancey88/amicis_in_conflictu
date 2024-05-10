require "rails_helper"

RSpec.describe ArmyListsController, type: :routing do
  let(:army) { create(:army) }

  describe "routing" do
    it "routes to #index" do
      expect(get: "/armies/#{army.id}/army_lists").to route_to("army_lists#index", army_id: army.id)
    end

    it "routes to #new" do
      expect(get: "/armies/#{army.id}/army_lists/new").to route_to("army_lists#new", army_id: army.id)
    end

    it "routes to #show" do
      expect(get: "/armies/#{army.id}/army_lists/1").to route_to("army_lists#show", army_id: army.id, id: "1")
    end

    it "routes to #edit" do
      expect(get: "/armies/#{army.id}/army_lists/1/edit").to route_to("army_lists#edit", army_id: army.id, id: "1")
    end

    it "routes to #create" do
      expect(post: "/armies/#{army.id}/army_lists").to route_to("army_lists#create", army_id: army.id)
    end

    it "routes to #update via PUT" do
      expect(put: "/armies/#{army.id}/army_lists/1").to route_to("army_lists#update", army_id: army.id, id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/armies/#{army.id}/army_lists/1").to route_to("army_lists#update", army_id: army.id, id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/armies/#{army.id}/army_lists/1").to route_to("army_lists#destroy", army_id: army.id, id: "1")
    end
  end
end
