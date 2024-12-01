require "rails_helper"

RSpec.describe "/army_lists", type: :request do
  let(:user) { create(:user) }
  let(:army) { create(:army, user:) }
  let(:game_system) { create(:wargame) }
  let!(:army_list) { create(:army_list) }

  let(:valid_attributes) {
    {
      name: "Army List",
      game_system_id: game_system.id
    }
  }

  let(:invalid_attributes) {
    {
      name: nil
    }
  }

  before do
    sign_in(user)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get army_lists_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get army_list_url(army_list)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_army_list_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_army_list_url(army_list)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ArmyList" do
        expect {
          post army_lists_url, params: {army_list: valid_attributes}
        }.to change(ArmyList, :count).by(1)
      end

      it "redirects to the created army_list" do
        post army_lists_url, params: {army_list: valid_attributes}
        expect(response).to redirect_to(army_list_url(ArmyList.order(:created_at).last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ArmyList" do
        expect {
          post army_lists_url, params: {army_list: invalid_attributes}
        }.to change(ArmyList, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post army_lists_url, params: {army_list: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: "New Name"
        }
      }

      it "updates the requested army_list" do
        patch army_list_url(army_list), params: {army_list: new_attributes}
        army_list.reload
        expect(army_list.name).to eq("New Name")
      end

      it "redirects to the army_list" do
        patch army_list_url(army_list), params: {army_list: new_attributes}
        army_list.reload
        expect(response).to redirect_to(army_list_url(army_list))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch army_list_url(army_list), params: {army_list: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested army_list" do
      expect {
        delete army_list_url(army_list)
      }.to change(ArmyList, :count).by(-1)
    end

    it "redirects to the army_lists list" do
      delete army_list_url(army_list)
      expect(response).to redirect_to(army_lists_url)
    end
  end
end
