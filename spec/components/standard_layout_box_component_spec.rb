require "rails_helper"

RSpec.describe StandardLayoutBoxComponent, type: :component do
  before do
    render_inline(described_class.new(title: "test"))
  end

  it "should render the title" do
    expect(page).to have_css(".standard-box_header-text", text: "test")
  end
end
