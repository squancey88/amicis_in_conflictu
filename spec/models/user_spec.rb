require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create(:user, email: "test@testing.co.uk", firstname: "Bruce", surname: "Wayne", nickname: "Batman") }
  let(:user_no_nickname) { create(:user, email: "test@testing.co.uk", firstname: "Bilbo", surname: "Baggins") }
  let(:user_no_name) { create(:user, email: "noname@testing.co.uk", firstname: nil, surname: nil) }
  let(:invited_user) { create(:user, :invite_pending) }

  context "associations" do
    it { should have_many(:user_group_memberships) }
    it { should have_many(:gaming_groups) }
    it { should have_many(:players) }
    it { should have_many(:army_lists) }
  end

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
    it "should not be pending_invite for non invited user" do
      expect(user.pending_invite?).to be false
    end

    it "should be pending_invite for user with token" do
      expect(invited_user.pending_invite?).to be true
    end
  end
end
