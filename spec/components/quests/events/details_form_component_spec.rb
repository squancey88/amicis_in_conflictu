# frozen_string_literal: true

require "rails_helper"

RSpec.describe Quests::Events::DetailsFormComponent, type: :helper do
  include ViewComponent::TestHelpers

  let(:world) { create(:world) }
  let(:quest) { create(:quest, world:) }
  let(:quest_event) { create(:quest_event, quest:) }

  before do
    form_with model: [world, quest, quest_event] do |form|
      render_inline(described_class.new(quest_event:, form:))
    end
  end

  it "renders an accordion" do
    expect(page).to have_css("div.accordion")
  end

  it "renders new text section link" do
    expect(page).to have_link("New Text Section", href: quest_event_data_new_text_section_path)
  end
end
