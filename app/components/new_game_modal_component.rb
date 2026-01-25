# frozen_string_literal: true

class NewGameModalComponent < ViewComponent::Base
  delegate :game_system_select, :player_selection, :member_selection, :team_selection,
    :turbo_frame_tag, :react_component, :game_system_grouped_hashes, :campaigns_grouped_by_game_system,
    to: :helpers

  def initialize(gaming_session:)
    @gaming_session = gaming_session
    @new_game = Game.new(gaming_session: @gaming_session)
  end

  def game_form_props
    {
      grouped_game_systems: game_system_grouped_hashes,
      players_selector: players_selector_props,
      campaigns_by_game_system: campaigns_grouped_by_game_system(@gaming_session.gaming_group)
    }
  end

  def players_selector_props
    {
      field_name: "game[players_attributes]",
      users: @gaming_session.gaming_group.members.map { {id: _1.id, name: _1.display_name, type: :User} },
      teams: @gaming_session.gaming_group.teams.map { {id: _1.id, name: _1.name, type: :Team} }
    }
  end
end
