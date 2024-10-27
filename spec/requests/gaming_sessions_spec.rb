require "rails_helper"

RSpec.describe "/gaming_sessions", type: :request do
  let(:gaming_group) { create(:gaming_group) }
  let(:member) {
    user = create(:user)
    create(:user_group_membership, user:, gaming_group:)
    user
  }
  let!(:gaming_session) { create(:gaming_session, gaming_group:) }
  let(:non_member) { create(:user) }
  let(:valid_attributes) {
    {
      start_time: DateTime.now
    }
  }

  let(:invalid_attributes) {
    {
      start_time: nil
    }
  }

  context "as non member" do
    before do
      sign_in(non_member)
    end

    describe "GET /show" do
      it "redirects to gaming group" do
        get gaming_group_gaming_session_url(gaming_group, gaming_session)
        expect(response).to redirect_to(gaming_group_url(gaming_group))
      end
    end

    describe "GET /edit" do
      it "redirects to gaming group" do
        gaming_session = create(:gaming_session, gaming_group:)
        get edit_gaming_group_gaming_session_url(gaming_group, gaming_session)
        expect(response).to redirect_to(gaming_group_url(gaming_group))
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "should not create a session attached to gaming group" do
          expect {
            post gaming_group_gaming_sessions_url(gaming_group), params: {gaming_session: valid_attributes}
          }.to change(GamingSession, :count).by(0)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {
            start_time: 2.days.from_now
          }
        }

        it "does not update the requested gaming_session" do
          current_time = gaming_session.start_time
          patch gaming_group_gaming_session_url(gaming_group, gaming_session), params: {gaming_session: new_attributes}
          gaming_session.reload
          expect(gaming_session.start_time).to eq(current_time)
        end

        it "redirects to the gaming group" do
          patch gaming_group_gaming_session_url(gaming_group, gaming_session), params: {gaming_session: new_attributes}
          expect(response).to redirect_to(gaming_group_url(gaming_group))
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested gaming_session" do
        expect {
          delete gaming_group_gaming_session_url(gaming_group, gaming_session)
        }.to change(GamingSession, :count).by(0)
      end

      it "redirects to the gaming_group" do
        delete gaming_group_gaming_session_url(gaming_group, gaming_session)
        expect(response).to redirect_to(gaming_group)
      end
    end
  end

  context "as member" do
    before do
      sign_in(member)
    end

    describe "GET /show" do
      it "renders a successful response" do
        get gaming_group_gaming_session_url(gaming_group, gaming_session)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_gaming_group_gaming_session_url(gaming_group)
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        gaming_session = create(:gaming_session, gaming_group:)
        get edit_gaming_group_gaming_session_url(gaming_group, gaming_session)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new GamingSession" do
          expect {
            post gaming_group_gaming_sessions_url(gaming_group), params: {gaming_session: valid_attributes}
          }.to change(GamingSession, :count).by(1)
        end

        it "redirects to the created gaming_session" do
          post gaming_group_gaming_sessions_url(gaming_group), params: {gaming_session: valid_attributes}
          expect(response).to redirect_to(gaming_group_gaming_session_url(gaming_group, GamingSession.order(:created_at).last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new GamingSession" do
          expect {
            post gaming_group_gaming_sessions_url(gaming_group), params: {gaming_session: invalid_attributes}
          }.to change(GamingSession, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post gaming_group_gaming_sessions_url(gaming_group), params: {gaming_session: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {
            start_time: 2.days.from_now
          }
        }

        it "updates the requested gaming_session" do
          patch gaming_group_gaming_session_url(gaming_group, gaming_session), params: {gaming_session: new_attributes}
          gaming_session.reload
          expect(gaming_session.start_time).to be_within(1.second).of(new_attributes[:start_time])
        end

        it "redirects to the gaming_session" do
          patch gaming_group_gaming_session_url(gaming_group, gaming_session), params: {gaming_session: new_attributes}
          gaming_session.reload
          expect(response).to redirect_to(gaming_group_gaming_session_url(gaming_group))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          patch gaming_group_gaming_session_url(gaming_group, gaming_session), params: {gaming_session: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested gaming_session" do
        expect {
          delete gaming_group_gaming_session_url(gaming_group, gaming_session)
        }.to change(GamingSession, :count).by(-1)
      end

      it "redirects to the gaming_sessions list" do
        delete gaming_group_gaming_session_url(gaming_group, gaming_session)
        expect(response).to redirect_to(gaming_group_gaming_sessions_url(gaming_group))
      end
    end
  end
end
