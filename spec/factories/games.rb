FactoryBot.define do
  factory :game do
    gaming_session
    game_system { create(:wargame) }
    campaign { nil }

    transient do
      player_count { 2 }
      user_list { [] }
      army_list { [] }
      initial_data { nil }
    end

    before(:create) do |game, context|
      army_lists = []
      players = if context.user_list.any?
        context.user_list.map.with_index do |u, index|
          player = build(:player, controller: u)
          if context.army_list.any?
            list = context.army_list[index]
            if list
              army_lists << build(:player_army, player:,
                army: list.army,
                army_list: list)
            end
          end
          player
        end
      else
        build_list(:player, context.player_count, :with_team)
      end
      game.players = players
      game.set_initial_data(**context.initial_data) if context.initial_data
      army_lists.each { _1.save! }
    end
  end
end
