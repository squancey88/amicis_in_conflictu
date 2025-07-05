require "rails_helper"

RSpec.describe ArticlesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/worlds/2/articles").to route_to("articles#index", world_id: "2")
    end

    it "routes to #new" do
      expect(get: "/worlds/2/articles/new").to route_to("articles#new", world_id: "2")
    end

    it "routes to #show" do
      expect(get: "/worlds/2/articles/1").to route_to("articles#show", id: "1", world_id: "2")
    end

    it "routes to #edit" do
      expect(get: "/worlds/2/articles/1/edit").to route_to("articles#edit", id: "1", world_id: "2")
    end

    it "routes to #create" do
      expect(post: "/worlds/2/articles").to route_to("articles#create", world_id: "2")
    end

    it "routes to #update via PUT" do
      expect(put: "/worlds/2/articles/1").to route_to("articles#update", id: "1", world_id: "2")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/worlds/2/articles/1").to route_to("articles#update", id: "1", world_id: "2")
    end

    it "routes to #destroy" do
      expect(delete: "/worlds/2/articles/1").to route_to("articles#destroy", id: "1", world_id: "2")
    end
  end
end
