require "rails_helper"

RSpec.describe "characters/show", type: :view do
  let(:owner) { create(:user) }
  let(:controlled_by) { create(:user) }
  let(:other_person) { create(:user) }
  let(:world) { create(:world, owner:) }
  let(:character) {
    create(:character, world:, controlled_by:,
      shared_notes: generate_text_section,
      world_owner_notes: generate_text_section,
      player_notes: generate_text_section)
  }

  before(:each) do
    assign(:character, character)
  end

  describe "world owner" do
    before do
      allow(view).to receive(:current_user) { owner }
      render
    end

    it "renders full name in <h1>" do
      expect(rendered).to have_css("h1", text: /#{character.full_name}/)
    end

    it "renders correct hidden sections" do
      expect(rendered).to have_css("div[data-test-shared-notes]")
      expect(rendered).not_to have_css("div[data-test-player-notes]")
      expect(rendered).to have_css("div[data-test-world-owner-notes]")
    end
  end

  describe "character controller" do
    before do
      allow(view).to receive(:current_user) { controlled_by }
      render
    end

    it "renders full name in <h1>" do
      expect(rendered).to have_css("h1", text: /#{character.full_name}/)
    end

    it "renders correct hidden sections" do
      expect(rendered).to have_css("div[data-test-shared-notes]")
      expect(rendered).to have_css("div[data-test-player-notes]")
      expect(rendered).not_to have_css("div[data-test-world-owner-notes]")
    end
  end

  describe "other user" do
    before do
      allow(view).to receive(:current_user) { other_person }
      render
    end

    it "renders full name in <h1>" do
      expect(rendered).to have_css("h1", text: /#{character.full_name}/)
    end

    it "renders correct hidden sections" do
      expect(rendered).not_to have_css("div[data-test-shared-notes]")
      expect(rendered).not_to have_css("div[data-test-player-notes]")
      expect(rendered).not_to have_css("div[data-test-world-owner-notes]")
    end
  end
end
