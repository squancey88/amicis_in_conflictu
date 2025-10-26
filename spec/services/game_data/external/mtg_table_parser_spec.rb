require "rails_helper"

RSpec.describe GameData::External::MtgTableParser, type: :service do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }

  let(:game) {
    game = create(:game, user_list: [user1, user2, user3])

    external_data = JSON.parse(File.read("spec/fixtures/table_data/v1_example.json"))

    external_data["aic_id"] = game.id
    external_data["players"][0]["aic_id"] = user1.id
    external_data["players"][1]["aic_id"] = user2.id
    external_data["players"][2]["aic_id"] = user3.id

    game.update!(data: {external_data: external_data})
    game
  }
  let(:response) { described_class.call(game:) }

  it "should return graph data" do
    expect(response).to have_key(:graph)
    # This needs a lot of improvment
  end
end
