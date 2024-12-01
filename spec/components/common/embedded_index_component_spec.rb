# frozen_string_literal: true

require "rails_helper"

RSpec.describe Common::EmbeddedIndexComponent, type: :component do
  let(:wargame) { create(:wargame) }
  before do
    render_inline(described_class.new(
      title: "Traits",
      turbo_frame_id: "unit_traits",
      records_path: "/unit_traits?game_system_id=#{wargame.id}",
      new_path: "/unit_traits/new?game_system_id=#{wargame.id}"
    ))
  end

  it "should render title" do
    expect(page).to have_text("Traits")
  end
end
