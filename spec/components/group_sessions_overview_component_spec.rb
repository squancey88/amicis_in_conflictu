require "rails_helper"

RSpec.describe GroupSessionsOverviewComponent, type: :component do
  let(:gaming_group) { create(:gaming_group) }
  before do
    render_inline(described_class.new(gaming_group:))
  end

  it "should have a tab section" do
    expect(page).to have_css(".nav-tabs")
  end
end
