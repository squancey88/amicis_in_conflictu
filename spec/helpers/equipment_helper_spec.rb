require "rails_helper"

RSpec.describe EquipmentHelper, type: :helper do
  let(:game_system) { create(:wargame) }
  let(:army_list) { create(:army_list, game_system:) }

  it "should render equipment select" do
    form_res = form_with url: attach_equipment_army_list_path(army_list) do |form|
      helper.bootstrap_equipment_select(game_system, form, :equipment_id)
    end
    expect(form_res).to have_css("select")
  end
end
