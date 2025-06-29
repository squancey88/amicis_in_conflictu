# frozen_string_literal: true

require "rails_helper"

RSpec.describe Quests::Events::CardComponent, type: :component do
  let(:quest_event) { create(:quest_event) }

  before do
    render_inline(described_class.new(event: quest_event))
  end

  it "renders show button" do
    expect(page).to have_link("Show")
  end
end
