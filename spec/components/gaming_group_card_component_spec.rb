require "rails_helper"

RSpec.describe GamingGroupCardComponent, type: :component do
  let(:gaming_group) { create(:gaming_group) }

  before do
    render_inline(described_class.new(gaming_group:))
  end

  it "should render a card" do
    expect(page).to have_css(".card")
  end

  it "should render card title" do
    expect(page).to have_css(".card-title", text: gaming_group.name)
  end
end
