require "rails_helper"

RSpec.describe GroupSessionsOverviewComponent, type: :component do
  let(:gaming_group) { create(:gaming_group) }
  let!(:future_session) { create(:gaming_session, gaming_group:, start_time: Faker::Time.forward(days: 5)) }
  let!(:previous_session) { create(:gaming_session, gaming_group:, start_time: Faker::Time.backward(days: 5)) }
  before do
    render_inline(described_class.new(gaming_group:))
  end

  it "should have a tab section" do
    expect(page).to have_css(".nav-tabs")
  end
end
