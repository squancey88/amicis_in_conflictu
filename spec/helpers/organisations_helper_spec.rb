require "rails_helper"

# Specs in this file have access to a helper object that includes
# the OrganisationsHelper. For example:
#
# describe OrganisationsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe OrganisationsHelper, type: :helper do
  let(:world) { create(:world) }

  it "should render type select" do
    form_res = form_with model: [world, Organisation.new] do |form|
      helper.character_type_select(form, :type_id, world)
    end
    expect(form_res).to have_css("select")
  end
end
