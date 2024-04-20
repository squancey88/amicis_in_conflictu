FactoryBot.define do
  factory :game do
    gaming_session
    game_system

    transient do
      player_count { 2 }
    end

    before(:create) do |game, context|
      players = build_list(:player, context.player_count, :with_team)
      game.players = players
    end
  end
end
