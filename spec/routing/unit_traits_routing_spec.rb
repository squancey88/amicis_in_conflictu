require "rails_helper"

RSpec.describe UnitTraitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/unit_traits").to route_to("unit_traits#index")
    end

    it "routes to #new" do
      expect(get: "/unit_traits/new").to route_to("unit_traits#new")
    end

    it "routes to #show" do
      expect(get: "/unit_traits/1").to route_to("unit_traits#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/unit_traits/1/edit").to route_to("unit_traits#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/unit_traits").to route_to("unit_traits#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/unit_traits/1").to route_to("unit_traits#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/unit_traits/1").to route_to("unit_traits#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/unit_traits/1").to route_to("unit_traits#destroy", id: "1")
    end
  end
end
