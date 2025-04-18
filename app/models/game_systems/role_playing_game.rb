module GameSystems
  class RolePlayingGame < GameSystem
    include HasGameConfig

    config_can_have_campaigns

    def self.category_name
      "RPG"
    end
  end
end
