# frozen_string_literal: true

require "rails_helper"

RSpec.describe TeamModalComponent, type: :component do
  let(:gaming_group) { create(:gaming_group) }

  context "new team" do
    before do
      render_inline(described_class.new(gaming_group:)) { "New Team" }
    end

    it "should render name input" do
      expect(page).to have_css('input[name="team[name]"]')
    end

    it "should render button with correct text" do
      expect(page).to have_css(".btn", text: "New Team")
    end
  end

  context "existing team" do
    let(:team) { create(:team, gaming_group:, name: "Test Team") }

    before do
      render_inline(described_class.new(gaming_group:, team:)) { "Edit Team" }
    end

    it "should render name input" do
      expect(page).to have_css('input[name="team[name]"][value="Test Team"]')
    end

    it "should render button with correct text" do
      expect(page).to have_css(".btn", text: "Edit Team")
    end
  end
end
