require "rails_helper"

RSpec.describe "characters/index", type: :view do
  let(:world) { create(:world) }
  let!(:characters) { create_list(:character, 2) }

  before(:each) do
    pagy, characters = pagy(Character.all)
    assign(:characters, characters)
    assign(:pagy, pagy)
  end

  it "renders a list of characters" do
    render
    expect(rendered).to have_css(".list-group-item", text: characters[0].full_name)
    expect(rendered).to have_css(".list-group-item", text: characters[1].full_name)
  end
end
