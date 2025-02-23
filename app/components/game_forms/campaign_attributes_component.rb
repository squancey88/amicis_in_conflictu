# frozen_string_literal: true

class GameForms::CampaignAttributesComponent < ViewComponent::Base
  delegate :input_field_of_type,
    :players_attributes_form_name,
    to: :helpers

  def initialize(game:, form:, user_player:)
    @game = game
    @form = form
    @user_player = user_player
    @player_index = @game.players.index(@user_player)
  end

  def field_name(key)
    players_attributes_form_name(@player_index, "[game_data][campaign][changes][#{key}]")
  end

  def get_value(key)
    return nil unless @user_player.game_data.has_key?("campaign")
    @user_player.game_data["campaign"]["changes"][key.to_s]
  end

  def render?
    @game.game_system.campaign_list_attributes.any?
  end
end
