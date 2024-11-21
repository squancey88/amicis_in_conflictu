# frozen_string_literal: true

require "rails_helper"

RSpec.describe PlayerNotesComponent, type: :component do
  let(:game) { create(:game) }

  before do
    form = double("form")
    allow(form).to receive(:hidden_field).and_return "<input type='hidden' name='test'>".html_safe
    render_inline(described_class.new(player_form: form, current_player: nil, player_index: 0))
  end

  it "should render the editor div" do
    expect(page).to have_css(".text-editor-component")
  end
end
