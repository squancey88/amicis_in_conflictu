require "rails_helper"

RSpec.describe "characters/edit", type: :view do
  let(:owner) { create(:user) }
  let(:controlled_by) { create(:user) }
  let(:world) { create(:world, owner:) }
  let(:character) { create(:character, world:, controlled_by:) }

  before do
    assign(:character, character)
    assign(:world, world)
  end

  describe "as world owner" do
    before do
      allow(view).to receive(:current_user).and_return(owner)
      render
    end

    it "renders the edit character form" do
      expect(rendered).to have_css("form[action='#{world_character_path(world, character)}'][method='post']")
      expect(rendered).to have_css("input[name='character[given_name]']")
      expect(rendered).to have_css("input[name='character[family_name]']")
    end

    it "renders correct notes sections" do
      expect(rendered).to have_component_with_props("TextEditor", {fieldName: "character[shared_notes]"})
      expect(rendered).to have_component_with_props("TextEditor", {fieldName: "character[world_owner_notes]"})
      expect(rendered).not_to have_component_with_props("TextEditor", {fieldName: "character[player_notes]"})
    end
  end

  describe "as controller" do
    before do
      allow(view).to receive(:current_user).and_return(controlled_by)
      render
    end

    it "renders the edit character form" do
      expect(rendered).to have_css("form[action='#{world_character_path(world, character)}'][method='post']")
      expect(rendered).to have_css("input[name='character[given_name]']")
      expect(rendered).to have_css("input[name='character[family_name]']")
    end

    it "renders player notes" do
      expect(rendered).to have_component_with_props("TextEditor", {fieldName: "character[shared_notes]"})
      expect(rendered).to have_component_with_props("TextEditor", {fieldName: "character[player_notes]"})
      expect(rendered).not_to have_component_with_props("TextEditor", {fieldName: "character[world_owner_notes]"})
    end
  end
end
