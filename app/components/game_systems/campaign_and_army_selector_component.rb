# frozen_string_literal: true

class GameSystems::CampaignAndArmySelectorComponent < ViewComponent::Base
  delegate :current_user,
    :game_systems_with_army_lists_select,
    :bootstrap_field_wrapper,
    to: :helpers

  def initialize(form:, game_system_field: :game_system_id, campaign_field: :campaign_id, army_field: :army_id)
    @form = form
    @game_system_field = game_system_field
    @campaign_field = campaign_field
    @army_field = army_field
  end

  def selected_game_system
    @form&.object.send(@game_system_field)
  end

  def selected_armies
    return GameSystem.find(selected_game_system).armies if selected_game_system
    []
  end

  def army_select_options
    opts = {}
    opts[:include_blank] = "Select game system first" unless selected_game_system
    opts
  end

  def selected_campaigns
    return current_user.campaigns.where(game_system: selected_game_system) if selected_game_system
    []
  end

  def data
    {
      controller: "campaign-and-army-selector",
      campaign_and_army_selector_current_user_id_value: current_user.id
    }
  end
end
