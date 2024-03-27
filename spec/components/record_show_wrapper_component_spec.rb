# frozen_string_literal: true

require "rails_helper"

RSpec.describe RecordShowWrapperComponent, type: :component do
  let(:record) {
    create(:gaming_group)
  }

  before do
    render_inline(described_class.new(title: "Test", record:))
  end

  it "should show the title" do
    expect(page).to have_css("h2", text: "Test")
  end
end
