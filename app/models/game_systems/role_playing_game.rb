module GameSystems
  class RolePlayingGame < GameSystem
    include HasGameConfig

    config_can_have_campaigns

    def self.category_name
      "RPG"
    end

    def player_form_components
      [
        {
          title: "My Characters",
          component: PlayerForms::RolePlayingGame::MyCharactersComponent
        },
        {
          title: "DM Controls",
          component: PlayerForms::RolePlayingGame::DmControlsComponent
        },
        {
          title: "Your Notes",
          component: PlayerForms::NotesComponent
        }
      ]
    end
  end
end
