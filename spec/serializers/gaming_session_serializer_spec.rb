require "rails_helper"

RSpec.describe GamingSessionSerializer do
  let(:gaming_session) { create(:gaming_session) }

  it "serializes gaming_session attributes" do
    result = described_class.new(gaming_session).serialize

    expect(result[:id]).to eq(gaming_session.id)
    expect(result[:created_at]).to eq(gaming_session.created_at.to_s)
    expect(result[:updated_at]).to eq(gaming_session.updated_at.to_s)
  end
end
