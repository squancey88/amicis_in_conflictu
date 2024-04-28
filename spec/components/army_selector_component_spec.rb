# frozen_string_literal: true

require "rails_helper"

RSpec.describe ArmySelectorComponent, type: :component do
  let(:player) { create(:player, :with_game, :with_user) }

  before do
    render_inline(described_class.new(player:))
  end

  it "should have a btn" do
    expect(page).to have_css(".btn")
  end
end
