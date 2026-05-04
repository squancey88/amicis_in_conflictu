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
    expect(page).to have_css("[data-react-component='TextEditor']")
  end

  it "passes correct props to React" do
    doc = Nokogiri::HTML(rendered_content)
    node = doc.at_css("[data-react-component='TextEditor']")
    props = JSON.parse(node["data-props"])

    expect(props).to include(
      "label" => "Notes",
      "minHeight" => 200
    )
  end
end
