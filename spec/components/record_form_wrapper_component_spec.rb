require "rails_helper"

RSpec.describe RecordFormWrapperComponent, type: :component do
  let(:game) { create(:game) }

  before do
    form = double
    allow(form).to receive(:submit)
    render_inline(described_class.new(form:, record: game))
  end

  it "should render rounded box" do
    expect(page).to have_css(".rounded-3")
  end
end
