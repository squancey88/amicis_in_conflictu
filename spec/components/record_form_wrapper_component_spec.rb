require "rails_helper"

RSpec.describe RecordFormWrapperComponent, type: :component do
  let(:game) { create(:game) }

  before do
    form = double
    allow(form).to receive(:submit)
    render_inline(described_class.new(form:, record: game)) { |comp|
      comp.with_form_box { "Test" }
    }
  end

  it "should render grid" do
    expect(page).to have_css(".aic-grid")
  end
end
