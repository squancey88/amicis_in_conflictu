require "rails_helper"

RSpec.describe UnitStatModifiersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/unit_stat_modifiers").to route_to("unit_stat_modifiers#index")
    end

    it "routes to #new" do
      expect(get: "/unit_stat_modifiers/new").to route_to("unit_stat_modifiers#new")
    end

    it "routes to #show" do
      expect(get: "/unit_stat_modifiers/1").to route_to("unit_stat_modifiers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/unit_stat_modifiers/1/edit").to route_to("unit_stat_modifiers#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/unit_stat_modifiers").to route_to("unit_stat_modifiers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/unit_stat_modifiers/1").to route_to("unit_stat_modifiers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/unit_stat_modifiers/1").to route_to("unit_stat_modifiers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/unit_stat_modifiers/1").to route_to("unit_stat_modifiers#destroy", id: "1")
    end
  end
end
