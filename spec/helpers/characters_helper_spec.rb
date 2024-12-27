require "rails_helper"

RSpec.describe CharactersHelper, type: :helper do
  let(:world) { create(:world) }

  before do
    allow_any_instance_of(WorldsHelper).to receive(:current_world).and_return(world)
  end

  it "should render type select" do
    form_res = form_with model: Character.new do |form|
      helper.character_type_select(form, :type_id)
    end
    expect(form_res).to have_css("select")
  end

  it "should render species select" do
    form_res = form_with model: Character.new do |form|
      helper.character_species_type_select(form, :species_type_id)
    end
    expect(form_res).to have_css("select")
  end
end
