require "rails_helper"

RSpec.describe EquipmentController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/equipment").to route_to("equipment#index")
    end

    it "routes to #new" do
      expect(get: "/equipment/new").to route_to("equipment#new")
    end

    it "routes to #show" do
      expect(get: "/equipment/1").to route_to("equipment#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/equipment/1/edit").to route_to("equipment#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/equipment").to route_to("equipment#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/equipment/1").to route_to("equipment#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/equipment/1").to route_to("equipment#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/equipment/1").to route_to("equipment#destroy", id: "1")
    end
  end
end
