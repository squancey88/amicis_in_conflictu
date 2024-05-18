FactoryBot.define do
  factory :game do
    gaming_session
    game_system

    transient do
      player_count { 2 }
      user_list { [] }
    end

    before(:create) do |game, context|
      players = if context.user_list.any?
        context.user_list.map { |u| build(:player, controller: u) }
      else
        build_list(:player, context.player_count, :with_team)
      end
      game.players = players
    end
  end
end
