require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create(:user, email: "test@testing.co.uk", firstname: "Bruce", surname: "Wayne", nickname: "Batman") }
  let(:user_no_nickname) { create(:user, email: "test@testing.co.uk", firstname: "Bilbo", surname: "Baggins") }
  let(:user_no_name) { create(:user, email: "noname@testing.co.uk", firstname: nil, surname: nil) }

  context "attributes" do
    it { expect(user).to have_attributes(email: "test@testing.co.uk") }
  end

  context "methods" do
    it "should return fullname" do
      expect(user.fullname).to eq("Bruce Wayne")
    end

    it "should return email if no name" do
      expect(user_no_name.fullname).to eq(user_no_name.email)
    end

    context "display_name"

    it "should return fullname if no nickname" do
      expect(user_no_nickname.display_name).to eq(user_no_nickname.fullname)
    end

    it "should return nickname if has one" do
      expect(user.display_name).to eq(user.nickname)
    end
  end

  context "invitable" do
    let(:email) { Faker::Internet.email }
    it "should not be pending_invite for non invited user" do
      expect(user.pending_invite?).to be false
    end

    it "should be pending_invite for invited user" do
      invited_user = User.invite!(email:)
      expect(invited_user.pending_invite?).to be true
    end

    it "should not be pending_invite for invited user who has accepted" do
      user = User.invite!(email:)
      User.accept_invitation!(invitation_token: user.raw_invitation_token, password: "ad97nwj3o2")
      user.reload
      expect(user.pending_invite?).to be false
    end
  end
end
