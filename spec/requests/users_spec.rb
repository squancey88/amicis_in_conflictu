require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:user) { create(:user, firstname: "Bob") }

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
end
