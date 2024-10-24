require "rails_helper"

RSpec.describe "Auths", type: :request do
  let(:invited_user) { create(:user, :invite_pending) }
  let(:forgot_password_user) { create(:user, :forgot_password) }
  let(:user) { create(:user) }

  describe "GET /login" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /logout" do
    it "returns http success" do
      post "/logout"
      expect(response).to redirect_to(login_url)
      expect(session[:user_id]).to be_nil
    end
  end

  describe "POST /authenticate" do
    it "returns root to main page if valid login" do
      post "/auth/authenticate", params: {
        email: user.email,
        password: user.password
      }
      expect(response).to redirect_to(root_url)
      expect(session[:user_id]).to eq(user.id)
    end

    it "redirects to login if invalid login" do
      post "/auth/authenticate", params: {
        email: user.email,
        password: user.password + "test"
      }
      expect(response).to redirect_to(login_url)
      expect(session[:user_id]).to be_nil
    end
  end

  describe "GET /invite" do
    it "returns http success" do
      get "/invite", params: {invitation_token: invited_user.invitation_token}
      expect(response).to have_http_status(:success)
    end

    it "should redirect to root if no token" do
      get "/invite"
      expect(response).to redirect_to(root_url)
    end

    it "should redirect to root if token not found" do
      get "/invite", params: {invitation_token: "abc"}
      expect(response).to redirect_to(root_url)
    end
  end

  describe "POST /complete_invite" do
    it "returns http success" do
      password = Faker::Internet.password
      post "/auth/complete_invite", params: {
        password:, confirm_password: password, invitation_token: invited_user.invitation_token
      }
      invited_user.reload
      expect(invited_user.authenticate_password_migration(password)).to be(invited_user)
      expect(response).to redirect_to(login_url)
    end

    it "should fail to set password when they dont match" do
      password = Faker::Internet.password
      confirm_password = password + "123"
      post "/auth/complete_invite", params: {
        password:, confirm_password:, invitation_token: invited_user.invitation_token
      }
      invited_user.reload
      expect(invited_user.authenticate_password_migration(password)).to be false
      expect(response).to redirect_to(invite_url(params: {invitation_token: invited_user.invitation_token}))
    end
  end

  describe "GET /forgot_password" do
    it "returns http success" do
      get "/forgot_password"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /auth/request_password_reset" do
    it "redirects you to login" do
      expect(ResetUserPasswordService).to receive(:call).with(user: user)
      post "/auth/request_password_reset", params: {email: user.email}
      expect(response).to redirect_to(login_url)
    end

    it "doesnt call service when not a valid user" do
      expect(ResetUserPasswordService).to_not receive(:call).with(user: user)
      post "/auth/request_password_reset", params: {email: "invalid@squancey.co.uk"}
      expect(response).to redirect_to(login_url)
    end
  end

  describe "GET /password_reset" do
    it "returns http success" do
      get "/password_reset", params: {reset_password_token: forgot_password_user.reset_password_token}
      expect(response).to have_http_status(:success)
    end

    it "should redirect to root if no token" do
      get "/password_reset"
      expect(response).to redirect_to(root_url)
    end

    it "should redirect to root if token not found" do
      get "/password_reset", params: {reset_password_token: "abc"}
      expect(response).to redirect_to(root_url)
    end
  end

  describe "POST /complete_password_reset" do
    it "returns http success" do
      password = Faker::Internet.password
      post "/auth/complete_password_reset", params: {
        password:, confirm_password: password, reset_password_token: forgot_password_user.reset_password_token
      }
      forgot_password_user.reload
      expect(forgot_password_user.authenticate_password_migration(password)).to be(forgot_password_user)
      expect(response).to redirect_to(login_url)
    end

    it "should fail to set password when they dont match" do
      password = Faker::Internet.password
      confirm_password = password + "123"
      post "/auth/complete_password_reset", params: {
        password:, confirm_password:, reset_password_token: forgot_password_user.reset_password_token
      }
      forgot_password_user.reload
      expect(forgot_password_user.authenticate_password_migration(password)).to be false
      expect(response).to redirect_to(forgot_password_url(params: {reset_password_token: forgot_password_user.reset_password_token}))
    end
  end
end
