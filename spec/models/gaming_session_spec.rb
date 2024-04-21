require "rails_helper"

RSpec.describe GamingSession, type: :model do
  let(:gaming_session) { create(:gaming_session, start_time: "2024/1/1 12:00") }

  context "attributes" do
    it { expect(gaming_session).to have_attributes(start_time: DateTime.parse("2024/1/1 12:00")) }
    it { expect(gaming_session.to_s).to eq(I18n.l(gaming_session.start_time)) }
  end
end
