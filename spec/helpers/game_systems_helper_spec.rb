require "rails_helper"

# Specs in this file have access to a helper object that includes
# the GameSystemsHelper. For example:
#
# describe GameSystemsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe GameSystemsHelper, type: :helper do
  let(:wargame) { create(:wargame) }
  let(:rpg) { create(:rpg) }

  before do
    wargame
    rpg
  end

  it "should return select" do
    form_res = form_for Game.new do |form|
      game_system_select(form, :game_system_id)
    end
    expect(form_res).to have_css("select")
  end
end
