require "rails_helper"

RSpec.describe GameSystems::CardGame, type: :model do
  let(:game_system) { create(:card_game, name: "Test") }

  it "has turns" do
    expect(game_system.has_turns?).to be true
  end

  context "attributes" do
    it { expect(game_system).to have_attributes(name: "Test") }
  end

  context "setup game data" do
    describe "with health" do
      let(:game_system) {
        create(:card_game, game_config: {
          has_health: true
        })
      }

      it "should return true for has_health" do
        expect(game_system.has_health?).to be true
      end
    end

    describe "with timed turns" do
      let(:timed_turn_game_system) {
        create(:card_game, game_config: {
          has_timed_turns: true
        })
      }

      it "should return true for has_timed_turns" do
        expect(timed_turn_game_system.has_timed_turns?).to be true
      end
    end
  end

  context "has health" do
    let(:card_game) { create(:card_game, :has_health) }
    let(:game) { create(:game, player_count: 2, game_system: card_game, initial_data: {starting_health: 40}) }
    let(:player1) { game.players.first }
    let(:player2) { game.players.last }

    it "should setup player data correctly" do
      expect(player1.game_data["starting_health"]).to eq(40)
      expect(player1.game_data["current_health"]).to eq(40)
      expect(player1.game_data["health_changes"]).to eq([])
    end

    context "health changes" do
      it "should update current_health after single update" do
        player1.game_data["health_changes"] << {
          change: -5,
          attacking_player_id: player2.id,
          is_commander: false
        }
        player1.save!
        player1.reload
        expect(player1.game_data["current_health"]).to eq(35)
      end

      it "should update current_health but never go below 0" do
        player1.game_data["health_changes"] << {
          change: -45,
          attacking_player_id: player2.id,
          is_commander: false
        }
        player1.save!
        player1.reload
        expect(player1.game_data["current_health"]).to eq(0)
      end

      it "should update current_health after multiple updates" do
        player1.game_data["health_changes"] << {
          change: -5,
          attacking_player_id: player2.id,
          is_commander: false
        }
        player1.save!
        player1.game_data["health_changes"] << {
          change: -9,
          attacking_player_id: player2.id,
          is_commander: false
        }
        player1.save!
        player1.reload
        expect(player1.game_data["current_health"]).to eq(26)
      end
    end

    it "should calculate winner correctly" do
      player1.game_data["health_changes"] << {
        change: -40,
        attacking_player_id: player2.id,
        is_commander: false
      }
      player1.save!
      player1.reload
      player2.reload
      game.finish_reason = "Game End"
      game.game_state = :finished
      game.save!
      expect(player1.game_data["current_health"]).to eq(0)
      expect(player1.lost?).to be true
      expect(player2.won?).to be true
    end
  end
end
