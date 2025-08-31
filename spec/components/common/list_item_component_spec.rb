# frozen_string_literal: true

require "rails_helper"

RSpec.describe Common::ListItemComponent, type: :component do
  let(:record) { create(:location) }

  it "should raise error as cannot be called directly" do
    expect {
      render_inline(described_class.new(record:))
    }.to raise_error(NotImplementedError)
  end
end
