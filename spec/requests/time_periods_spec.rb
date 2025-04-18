require "rails_helper"

RSpec.describe "/time_periods", type: :request do
  let(:user) { create(:user) }
  let(:world) { create(:world, owner: user) }
  let!(:time_period) { create(:time_period, world:) }
  let(:valid_attributes) {
    {
      name: "First Age",
      order: 1
    }
  }

  let(:invalid_attributes) {
    {
      name: nil
    }
  }

  before do
    sign_in(user)
    start_world_builder_mode(world)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get time_periods_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get time_period_url(time_period)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_time_period_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_time_period_url(time_period)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new TimePeriod" do
        expect {
          post time_periods_url, params: {time_period: valid_attributes}
        }.to change(TimePeriod, :count).by(1)
      end

      it "redirects to the created time_period" do
        post time_periods_url, params: {time_period: valid_attributes}
        expect(response).to redirect_to(time_period_url(TimePeriod.order(:created_at).last))
      end

      it "sets the world correctly" do
        post time_periods_url, params: {time_period: valid_attributes}
        expect(TimePeriod.order(:created_at).last.world).to eq(world)
      end
    end

    context "with invalid parameters" do
      it "does not create a new TimePeriod" do
        expect {
          post time_periods_url, params: {time_period: invalid_attributes}
        }.to change(TimePeriod, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post time_periods_url, params: {time_period: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: "New name"
        }
      }

      it "updates the requested time_period" do
        patch time_period_url(time_period), params: {time_period: new_attributes}
        time_period.reload
        expect(time_period.name).to eq("New name")
      end

      it "redirects to the time_period" do
        patch time_period_url(time_period), params: {time_period: new_attributes}
        time_period.reload
        expect(response).to redirect_to(time_period_url(time_period))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch time_period_url(time_period), params: {time_period: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested time_period" do
      expect {
        delete time_period_url(time_period)
      }.to change(TimePeriod, :count).by(-1)
    end

    it "redirects to the time_periods list" do
      delete time_period_url(time_period)
      expect(response).to redirect_to(time_periods_url)
    end
  end
end
