require "rails_helper"

RSpec.describe GamingSession, type: :model do
  let(:gaming_session) { create(:gaming_session, start_time: "2024/1/1 12:00") }
  let(:old_gaming_session) { create(:gaming_session, start_time: Time.zone.now.days_ago(2)) }
  let(:today_gaming_session) { create(:gaming_session, start_time: Time.zone.now) }
  let(:upcoming_gaming_session) { create(:gaming_session, start_time: 3.hours.from_now) }

  context "attributes" do
    it { expect(gaming_session).to have_attributes(start_time: DateTime.parse("2024/1/1 12:00")) }
    it { expect(gaming_session.to_s).to eq(I18n.l(gaming_session.start_time)) }
  end

  context "scopes" do
    before do
      old_gaming_session
      today_gaming_session
      upcoming_gaming_session
    end
    describe "upcoming" do
      it "should include correct sessions" do
        expect(GamingSession.upcoming).not_to include(old_gaming_session)
        expect(GamingSession.upcoming).to include(today_gaming_session)
        expect(GamingSession.upcoming).to include(upcoming_gaming_session)
      end
    end

    describe "previous" do
      it "should include correct sessions" do
        expect(GamingSession.previous).to include(old_gaming_session)
        expect(GamingSession.previous).not_to include(today_gaming_session)
        expect(GamingSession.previous).not_to include(upcoming_gaming_session)
      end
    end
  end
end
