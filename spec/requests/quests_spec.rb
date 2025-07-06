require "rails_helper"

RSpec.describe "/quests", type: :request do
  let(:user) { create(:user) }
  let(:world) { create(:world, owner: user) }

  let!(:quest) { create(:quest, world:, created_by: user) }

  let(:valid_attributes) {
    {
      title: "Test quest"
    }
  }

  let(:invalid_attributes) {
    {
      title: nil
    }
  }

  before do
    sign_in(user)
    start_world_builder_mode(world)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get world_quests_url(world)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get world_quest_url(world, quest)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_world_quest_url(world)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_world_quest_url(world, quest)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Quest" do
        expect {
          post world_quests_url(world), params: {quest: valid_attributes}
        }.to change(Quest, :count).by(1)
      end

      it "redirects to the created quest" do
        post world_quests_url(world), params: {quest: valid_attributes}
        expect(response).to redirect_to(world_quest_url(world, Quest.order(:created_at).last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Quest" do
        expect {
          post world_quests_url(world), params: {quest: invalid_attributes}
        }.to change(Quest, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post world_quests_url(world), params: {quest: invalid_attributes}
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
        patch world_quest_url(world, quest), params: {quest: new_attributes}
        quest.reload
        expect(quest.title).to eq("New title")
      end

      it "redirects to the quest" do
        patch world_quest_url(world, quest), params: {quest: new_attributes}
        quest.reload
        expect(response).to redirect_to(world_quest_url(world, quest))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch world_quest_url(world, quest), params: {quest: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested quest" do
      expect {
        delete world_quest_url(world, quest)
      }.to change(Quest, :count).by(-1)
    end

    it "redirects to the quests list" do
      delete world_quest_url(world, quest)
      expect(response).to redirect_to(world_url(world))
    end
  end
end
