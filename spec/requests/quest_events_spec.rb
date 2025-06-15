require "rails_helper"

RSpec.describe "/quests", type: :request do
  let(:user) { create(:user) }
  let(:world) { create(:world, owner: user) }

  let!(:quest) { create(:quest, world:, created_by: user) }
  let!(:quest_event) { create(:quest_event, quest:) }

  let(:valid_attributes) {
    {
      title: "Test event"
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
      get quest_quest_events_url(quest, quest_event)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_quest_quest_event_url(quest)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_quest_quest_event_url(quest, quest_event)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Quest Event" do
        expect {
          post quest_quest_events_url(quest), params: {quest_event: valid_attributes}
        }.to change(QuestEvent, :count).by(1)
      end

      it "redirects to the created quest event" do
        post quest_quest_events_url(quest), params: {quest_event: valid_attributes}
        expect(response).to redirect_to(quest_url(quest))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Quest Event" do
        expect {
          post quest_quest_events_url(quest), params: {quest_event: invalid_attributes}
        }.to change(QuestEvent, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post quest_quest_events_url(quest), params: {quest_event: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {title: "New title"}
      }

      it "updates the requested quest event" do
        patch quest_quest_event_url(quest, quest_event), params: {quest_event: new_attributes}
        quest_event.reload
        expect(quest_event.title).to eq("New title")
      end

      it "redirects to the quest event" do
        patch quest_quest_event_url(quest, quest_event), params: {quest_event: new_attributes}
        expect(response).to redirect_to(edit_quest_quest_event_url(quest, quest_event))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch quest_quest_event_url(quest, quest_event), params: {quest_event: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested quest event" do
      expect {
        delete quest_quest_event_url(quest, quest_event)
      }.to change(QuestEvent, :count).by(-1)
    end

    it "redirects to the quests" do
      delete quest_quest_event_url(quest, quest_event)
      expect(response).to redirect_to(quest_url(quest))
    end
  end
end
