require "rails_helper"

RSpec.describe "/campaigns", type: :request do
  let(:gaming_group) { create(:gaming_group) }
  let(:member) {
    user = create(:user)
    create(:user_group_membership, user:, gaming_group:)
    user
  }
  let!(:campaign) { create(:campaign, gaming_group: gaming_group) }
  let(:game_system) { create(:game_system) }
  let(:valid_attributes) {
    {
      name: Faker::Lorem.word,
      game_system_id: game_system.id
    }
  }

  let(:invalid_attributes) {
    {name: nil}
  }

  before do
    sign_in(member)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get gaming_group_campaigns_url(gaming_group)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get gaming_group_campaign_url(gaming_group, campaign)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_gaming_group_campaign_url(gaming_group)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_gaming_group_campaign_url(gaming_group, campaign)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Campaign" do
        expect {
          post gaming_group_campaigns_url(gaming_group), params: {campaign: valid_attributes}
        }.to change(Campaign, :count).by(1)
      end

      it "redirects to the created campaign" do
        post gaming_group_campaigns_url(gaming_group), params: {campaign: valid_attributes}
        expect(response).to redirect_to(gaming_group_campaign_url(gaming_group, Campaign.order(:created_at).last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Campaign" do
        expect {
          post gaming_group_campaigns_url(gaming_group), params: {campaign: invalid_attributes}
        }.to change(Campaign, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post gaming_group_campaigns_url(gaming_group), params: {campaign: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "New name"}
      }

      it "updates the requested campaign" do
        patch gaming_group_campaign_url(gaming_group, campaign), params: {campaign: new_attributes}
        campaign.reload
        expect(campaign.name).to eq("New name")
      end

      it "redirects to the campaign" do
        patch gaming_group_campaign_url(gaming_group, campaign), params: {campaign: new_attributes}
        campaign.reload
        expect(response).to redirect_to(gaming_group_campaign_url(gaming_group, campaign))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch gaming_group_campaign_url(gaming_group, campaign), params: {campaign: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested campaign" do
      expect {
        delete gaming_group_campaign_url(gaming_group, campaign)
      }.to change(Campaign, :count).by(-1)
    end

    it "redirects to the campaigns list" do
      delete gaming_group_campaign_url(gaming_group, campaign)
      expect(response).to redirect_to(gaming_group_campaigns_url(gaming_group))
    end
  end
end
