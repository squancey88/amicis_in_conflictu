require "rails_helper"

RSpec.describe ApiKey, type: :model do
  it "returns true when token is expired" do
    token = create(:api_key, created_at: 5.days.ago, expires_in_days: 3)
    expect(token.expired?).to be true
  end

  it "returns false when token is not expired" do
    token = create(:api_key, created_at: 1.day.ago, expires_in_days: 3)
    expect(token.expired?).to be false
  end

  it "sets api key on creation" do
    token = create(:api_key, created_at: 1.day.ago, expires_in_days: 3)
    expect(token.key).not_to be_blank
  end
end
