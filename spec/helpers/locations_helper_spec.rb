require "rails_helper"

RSpec.describe LocationsHelper, type: :helper do
  let(:world) { create(:world) }
  let!(:location) { create(:location, world:, name: "Parent") }
  let!(:child_location) { create(:location, world:, located_in: location, name: "Child") }

  it "should render type select" do
    form_res = form_with model: [world, Location.new] do |form|
      helper.location_type_select(form, :location_type_id, world)
    end
    expect(form_res).to have_css("select")
  end

  it "should render located_in select" do
    form_res = form_with model: [world, Location.new] do |form|
      helper.located_in_select(form, :located_in, world)
    end
    expect(form_res).to have_css("select")
    expect(form_res).to have_css("option", count: 3) # includes blank

    expect(form_res).to have_text(" Parent")
    expect(form_res).to have_text("-- Child")
  end
end
