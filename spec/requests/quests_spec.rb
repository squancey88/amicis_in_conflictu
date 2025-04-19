require "rails_helper"

RSpec.describe "/quests", type: :request do
  let(:user) { create(:user) }
  let(:world) { create(:world, owner: user) }

  let!(:quest) { create(:quest, world:, created_by: user) }

  let(:valid_attributes) {
    {
      title: "Test quest",
      world_id: world.id
    }
  }

  let(:invalid_attributes) {
    {
      title: nil,
      world_id: world.id
    }
  }

  before do
    sign_in(user)
    start_world_builder_mode(world)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get quests_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get quest_url(quest)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_quest_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_quest_url(quest)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Quest" do
        expect {
          post quests_url, params: {quest: valid_attributes}
        }.to change(Quest, :count).by(1)
      end

      it "redirects to the created quest" do
        post quests_url, params: {quest: valid_attributes}
        expect(response).to redirect_to(quest_url(Quest.order(:created_at).last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Quest" do
        expect {
          post quests_url, params: {quest: invalid_attributes}
        }.to change(Quest, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post quests_url, params: {quest: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {title: "New title"}
      }

      it "updates the requested quest" do
        patch quest_url(quest), params: {quest: new_attributes}
        quest.reload
        expect(quest.title).to eq("New title")
      end

      it "redirects to the quest" do
        patch quest_url(quest), params: {quest: new_attributes}
        quest.reload
        expect(response).to redirect_to(quest_url(quest))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch quest_url(quest), params: {quest: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested quest" do
      expect {
        delete quest_url(quest)
      }.to change(Quest, :count).by(-1)
    end

    it "redirects to the quests list" do
      delete quest_url(quest)
      expect(response).to redirect_to(quests_url)
    end
  end
end
