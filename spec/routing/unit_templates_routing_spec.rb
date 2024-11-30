require "rails_helper"

RSpec.describe UnitTemplatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/unit_templates").to route_to("unit_templates#index")
    end

    it "routes to #new" do
      expect(get: "/unit_templates/new").to route_to("unit_templates#new")
    end

    it "routes to #show" do
      expect(get: "/unit_templates/1").to route_to("unit_templates#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/unit_templates/1/edit").to route_to("unit_templates#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/unit_templates").to route_to("unit_templates#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/unit_templates/1").to route_to("unit_templates#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/unit_templates/1").to route_to("unit_templates#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/unit_templates/1").to route_to("unit_templates#destroy", id: "1")
    end
  end
end
