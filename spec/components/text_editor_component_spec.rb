require "rails_helper"

RSpec.describe TextEditorComponent, type: :helper do
  include ViewComponent::TestHelpers

  let(:game) { create(:game) }

  before do
    form_with model: game do |form|
      render_inline(described_class.new(form:, attribute: :notes))
    end
  end

  it "should render the editor div" do
    expect(page).to have_css(".text-editor-component")
  end
end
