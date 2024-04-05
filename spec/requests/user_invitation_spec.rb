require "rails_helper"

RSpec.describe "Invitations", type: :request do
  let(:email) { Faker::Internet.email }
  let(:firstname) { Faker::Name.first_name }
  let(:surname) { Faker::Name.last_name }

  describe "POST /user/invitation" do
    it "should setup user correctly" do
      user = User.invite!(email:)
      patch user_invitation_url, params: {
        user: {
          invitation_token: user.raw_invitation_token,
          password: Faker::Internet.password,
          firstname:,
          surname:
        }
      }
      user.reload
      expect(user.pending_invite?).to be false
      expect(user.firstname).to eq(firstname)
      expect(user.surname).to eq(surname)
    end
  end
end
