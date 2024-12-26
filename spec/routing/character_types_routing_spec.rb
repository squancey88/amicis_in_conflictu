require "rails_helper"

RSpec.describe CharacterTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/character_types").to route_to("character_types#index")
    end

    it "routes to #new" do
      expect(get: "/character_types/new").to route_to("character_types#new")
    end

    it "routes to #show" do
      expect(get: "/character_types/1").to route_to("character_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/character_types/1/edit").to route_to("character_types#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/character_types").to route_to("character_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/character_types/1").to route_to("character_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/character_types/1").to route_to("character_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/character_types/1").to route_to("character_types#destroy", id: "1")
    end
  end
end
