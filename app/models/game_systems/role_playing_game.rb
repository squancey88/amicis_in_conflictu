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

# == Schema Information
#
# Table name: game_systems
#
#  id             :uuid             not null, primary key
#  competitive    :boolean
#  edition        :string
#  game_config    :jsonb
#  has_armies     :boolean          default(FALSE)
#  has_army_lists :boolean          default(FALSE)
#  name           :string
#  slug           :string
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_game_systems_on_slug  (slug) UNIQUE
#
