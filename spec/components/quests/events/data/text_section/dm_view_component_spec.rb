# frozen_string_literal: true

require "rails_helper"

RSpec.describe Quests::Events::Data::TextSection::DmViewComponent, type: :component do
  let(:quest_event_datum) { create(:quest_event_data_text_section) }

  before do
    render_inline(described_class.new(quest_event_datum:))
  end

  it "should render title" do
    expect(page).to have_css("h4", text: quest_event_datum.title)
  end
end
