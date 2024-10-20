require "rails_helper"

RSpec.describe ResetUserPasswordService, type: :service do
  let(:user) { create(:user) }

  it "should set password reset token" do
    expect(user.reset_password_token).to be_nil
    described_class.call(user:)
    user.reload
    expect(user.reset_password_token).not_to be_nil
  end
  it "should send forgetten password email" do
    expect { described_class.call(user:) }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it "should set reset_password_sent_at" do
    described_class.call(user:)
    user.reload
    expect(user.reset_password_sent_at).not_to be_nil
  end
end
