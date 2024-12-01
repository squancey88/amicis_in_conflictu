# frozen_string_literal: true

require "rails_helper"

RSpec.describe Units::ListComponent, type: :component do
  let(:army_list) { create(:army_list) }
  let!(:unit) { create(:unit, army_list:) }

  before do
    render_inline(described_class.new(army_list:))
  end

  it "should display unit name" do
    expect(page).to have_css("h5", text: /#{unit.name}/)
  end
end
