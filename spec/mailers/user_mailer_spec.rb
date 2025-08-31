require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "invite" do
    let(:invited_user) { create(:user, :invite_pending) }
    let(:mail) { UserMailer.with(user: invited_user).invite }

    it "renders the headers" do
      expect(mail.subject).to eq("Invite")
      expect(mail.to).to eq([invited_user.email])
      expect(mail.from).to eq(["aic@squancey.co.uk"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include(invite_url(params: {invitation_token: invited_user.invitation_token}))
    end
  end

  describe "forgotten_password" do
    let(:user) { create(:user, :forgot_password) }
    let(:mail) { UserMailer.with(user:).forgotten_password }

    it "renders the headers" do
      expect(mail.subject).to eq("Forgotten password")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["aic@squancey.co.uk"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include(password_reset_url(params: {reset_password_token: user.reset_password_token}))
    end
  end
end
