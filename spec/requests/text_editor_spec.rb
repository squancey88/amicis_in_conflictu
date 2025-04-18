require "rails_helper"

RSpec.describe "TextEditors", type: :request do
  let(:user) { create(:user) }
  let(:world) { create(:world) }
  let!(:article) { create(:article, title: "Test article", world:) }
  let!(:article_not_in_world) { create(:article, title: "Another Test article") }

  before do
    sign_in(user)
  end

  context "in world building mode" do
    before do
      start_world_builder_mode(world)
    end

    describe "GET /link" do
      before do
        get "/text_editor/link", params: {search: "Test"}
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "response should include article" do
        data = JSON.parse(response.body)
        expect(data["items"]).to include(article.as_link.stringify_keys)
      end

      it "response should not include article from another world" do
        data = JSON.parse(response.body)
        expect(data["items"]).not_to include(article_not_in_world.as_link.stringify_keys)
      end
    end
  end
end
