require "rails_helper"

RSpec.describe "armies/index", type: :view do
  let(:game_system) { create(:wargame) }
  before(:each) do
    create_list(:army, 2, name: "Name", game_system:)
    pagy, armies = pagy(Army.all)
    assign(:armies, armies)
    assign(:pagy, pagy)
    render
  end

  it "renders a list of armies" do
    expect(rendered).to have_css(".card", count: 2)
  end
end
