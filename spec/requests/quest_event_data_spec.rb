require "rails_helper"

RSpec.describe "QuestEventData", type: :request do
  let(:user) { create(:user) }
  let(:quest_event) { create(:quest_event) }

  context "regular user" do
    before do
      sign_in(user)
    end

    describe "GET /new_text_section" do
      it "returns http success" do
        get quest_event_data_new_text_section_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
