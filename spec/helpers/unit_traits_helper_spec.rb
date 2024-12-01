require "rails_helper"

RSpec.describe UnitTraitsHelper, type: :helper do
  let(:game_system) { create(:wargame) }

  it "should render bootstrap_unit_traits_select" do
    form_res = form_with url: root_url do |form|
      helper.bootstrap_unit_traits_select(game_system, form, :unit_trait_id)
    end
    expect(form_res).to have_css("select")
  end
end
