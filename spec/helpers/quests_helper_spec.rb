require "rails_helper"

# Specs in this file have access to a helper object that includes
# the QuestsHelper. For example:
#
# describe QuestsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe QuestsHelper, type: :helper do
  let(:world) { create(:world) }

  it "should render quest select" do
    form_res = form_with model: world do |form|
      helper.quest_select(form, :quest_id, world)
    end
    expect(form_res).to have_css("select")
  end
end
