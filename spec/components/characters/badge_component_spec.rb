# frozen_string_literal: true

require "rails_helper"

RSpec.describe Characters::BadgeComponent, type: :component do
  let(:game) { create(:game) }
  let(:character) { create(:player_character, given_name: "Frodo", family_name: "Baggins") }

  before do
    render_inline(described_class.new(game:, character:, character_counter: 0))
  end

  it "renders show button" do
    expect(page).to have_text("Frodo Baggins")
  end
end
