require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create(:user, email: "test@testing.co.uk", firstname: "Bruce", surname: "Wayne") }
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
  end
end
