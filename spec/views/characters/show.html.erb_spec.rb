require "rails_helper"

RSpec.describe "characters/show", type: :view do
  let(:character) { create(:character) }
  before(:each) do
    assign(:character, character)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to have_css("p", text: /#{character.given_name}/)
  end
end
