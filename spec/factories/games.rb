FactoryBot.define do
  factory :game do
    gaming_session
    game_system

    before(:create) do |game|
      players = build_list(:player, 2, :with_team)
      game.players = players
    end
  end
end
