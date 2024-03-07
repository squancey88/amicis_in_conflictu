require "rails_helper"

RSpec.describe "Homes", type: :request do
  before do
    sign_in create(:user)
  end

  describe "GET /homepage" do
    it "should be succesful" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
