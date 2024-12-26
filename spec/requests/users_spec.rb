require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:user) { create(:user, firstname: "Bob") }
  let(:admin_user) { create(:user, admin: true) }
  let(:game_system) { create(:wargame) }

  context "regular user" do
    before do
      sign_in(user)
    end

    describe "GET /show" do
      it "returns http success" do
        get user_url(user)
        expect(response).to have_http_status(:success)
      end
    end

    describe "PATCH /update" do
      let(:valid_attributes) {
        {
          firstname: Faker::Name.first_name,
          surname: Faker::Name.last_name,
          nickname: Faker::Movies::LordOfTheRings.character
        }
      }

      let(:invalid_attributes) {
        {
          email: nil
        }
      }

      describe "with validate attributes" do
        it "should update user" do
          patch user_url(user), params: {
            user: valid_attributes
          }
          expect(response).to redirect_to(user)
          user.reload
          expect(user.firstname).to eq(valid_attributes[:firstname])
          expect(user.surname).to eq(valid_attributes[:surname])
          expect(user.nickname).to eq(valid_attributes[:nickname])
        end
      end

      describe "with invalidate attributes" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          patch user_url(user), params: {
            user: invalid_attributes
          }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "GET /campaigns" do
      it "returns http success" do
        get campaigns_user_url(user, filter: {game_system_id: game_system.id}, format: :json)
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST /emulate_user" do
      before do
        post emulate_user_users_path, params: {user_id: admin_user.id}
      end

      it "should redirect regular user" do
        expect(response).to redirect_to(root_url)
      end

      it "should not change session" do
        expect(session[:user_id]).to eq(user.id)
        expect(session[:original_user_id]).to be_nil
      end
    end

    describe "POST /stop_emulation" do
      before do
        post stop_emulation_users_path
      end

      it "should redirect regular user" do
        expect(response).to redirect_to(root_url)
      end
    end
  end

  context "admin user" do
    before do
      sign_in(admin_user)
    end

    describe "POST /emulate_user" do
      before do
        post emulate_user_users_path, params: {user_id: user.id}
      end
      it "should redirect user" do
        expect(response).to redirect_to(root_url)
      end

      it "should change session" do
        expect(session[:user_id]).to eq(user.id)
        expect(session[:original_user_id]).to eq(admin_user.id)
      end
    end

    describe "POST /stop_emulation" do
      before do
        post emulate_user_users_path, params: {user_id: user.id}
        post stop_emulation_users_path
      end

      it "should redirect user" do
        expect(response).to redirect_to(root_url)
      end

      it "should change session" do
        expect(session[:user_id]).to eq(admin_user.id)
        expect(session[:original_user_id]).to be_nil
      end
    end
  end
end
