require "rails_helper"

RSpec.describe FindOrInviteUserService, type: :service do
  let(:email) { Faker::Internet.email }
  let(:inviter) { create(:user) }
  let(:existing_user) { create(:user) }

  context "new user" do
    it "should create a new user" do
      described_class.call(email:, inviter:)
      expect(User.find_by(email:)).to be_truthy
    end

    it "should send invite email" do
      expect { described_class.call(email:, inviter:) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it "should set invited_by" do
      described_class.call(email:, inviter:)
      expect(User.find_by(email:).invited_by).to eq(inviter)
    end
  end

  context "with existing user" do
    it "should return a user" do
      user = described_class.call(email: existing_user.email, inviter:)
      expect(user).to eq(existing_user)
    end
  end
end
