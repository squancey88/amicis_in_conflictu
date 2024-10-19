require "rails_helper"

RSpec.describe AuthHelper, type: :helper do
  describe "current_user" do
    let(:user) { create(:user) }
    it "should return current user" do
      @request.session["user_id"] = user.id
      expect(current_user).to eq(user)
    end

    it "should return nil if there is no session" do
      expect(current_user).to be_nil
    end
  end
end
