require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create(:user, email: "test@testing.co.uk") }

  context "attributes" do
    it { expect(user).to have_attributes(email: "test@testing.co.uk") }
  end
end
