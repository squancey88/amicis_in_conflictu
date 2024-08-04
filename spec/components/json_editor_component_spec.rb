# frozen_string_literal: true

require "rails_helper"

RSpec.describe JsonEditorComponent, type: :component do
  before do
    render_inline(described_class.new(
      model: create(:wargame),
      attribute: :game_config,
      schema: GameSystems::Wargame.schema
    ))
  end

  it "renders input with correct name" do
    expect(page).to have_css('input[name="game_systems_wargame[game_config_json_string]"]', visible: false)
  end

  it "should render hidden input" do
    expect(page).to have_css("input[type='hidden']", visible: false)
  end
end
