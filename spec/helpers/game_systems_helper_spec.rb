require "rails_helper"

RSpec.describe GameSystemsHelper, type: :helper do
  let(:wargame) { create(:wargame) }
  let(:rpg) { create(:role_playing_game) }

  before do
    wargame
    rpg
  end

  it "should return select" do
    form_res = form_with model: Game.new do |form|
      helper.game_system_select(form, :game_system_id)
    end
    expect(form_res).to have_css("select")
  end
end
