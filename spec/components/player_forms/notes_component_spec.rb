# frozen_string_literal: true

require "rails_helper"

RSpec.describe PlayerForms::NotesComponent, type: :component_form do
  let(:game) { create(:game) }

  before do
    form_with model: game do |player_form|
      render_inline(described_class.new(game:, player_form:, current_player: nil, player_index: 0))
    end
  end

  it "should render the editor div" do
    expect(page).to have_css(".text-editor-component")
  end
end
