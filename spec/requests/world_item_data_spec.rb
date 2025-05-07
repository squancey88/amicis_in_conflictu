require "rails_helper"

RSpec.describe "WorldItemData", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  context "regular user" do
    before do
      sign_in(user)
    end

    describe "GET /new_text_section" do
      it "returns http success" do
        get world_item_data_new_text_section_path(params: {
          model: "Article",
          attribute: "sections"
        })
        expect(response).to have_http_status(:success)
      end
    end
  end
end
