require "rails_helper"

RSpec.describe CharactersHelper, type: :helper do
  let(:world) { create(:world) }

  it "should render type select" do
    form_res = form_with model: Character.new do |form|
      helper.character_type_select(form, :type_id, world)
    end
    expect(form_res).to have_css("select")
  end

  it "should render species select" do
    form_res = form_with model: Character.new do |form|
      helper.character_species_type_select(form, :species_type_id, world)
    end
    expect(form_res).to have_css("select")
  end
end
