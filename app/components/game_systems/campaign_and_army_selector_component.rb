# frozen_string_literal: true

class GameSystems::CampaignAndArmySelectorComponent < ViewComponent::Base
  delegate :current_user,
    :game_systems_with_army_lists_select,
    :bootstrap_field_wrapper,
    to: :helpers

  def initialize(form:, game_system_field: :game_system_id, campaign_field: :campaign_id)
    @form = form
    @game_system_field = game_system_field
    @campaign_field = campaign_field
  end

  def data
    {
      controller: "campaign-and-army-selector",
      campaign_and_army_selector_current_user_id_value: current_user.id
    }
  end
end
