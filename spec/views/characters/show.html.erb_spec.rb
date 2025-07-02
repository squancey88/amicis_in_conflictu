require "rails_helper"

RSpec.describe "characters/show", type: :view do
  let(:character) { create(:character) }
  before(:each) do
    assign(:character, character)
  end

  it "renders full name in <h1>" do
    render
    expect(rendered).to have_css("h1", text: /#{character.full_name}/)
  end
end
