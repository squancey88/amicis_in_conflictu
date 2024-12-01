require "rails_helper"

RSpec.describe UnitTemplatesHelper, type: :helper do
  let(:game_system) { create(:wargame) }

  it "should render bootstrap_unit_templates_select" do
    form_res = form_with url: root_url do |form|
      helper.bootstrap_unit_templates_select(game_system, form, :test)
    end
    expect(form_res).to have_css("select")
  end
end
