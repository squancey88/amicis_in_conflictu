# frozen_string_literal: true

class GameForms::ExternalTableDataComponent < ViewComponent::Base
  def initialize(game:, form:, user_player:)
    @game = game
    @form = form
    @user_player = user_player

    @parsed_data = GameData::External::MtgTableParser.call(game: @game)
  end

  def render?
    return false if @game.data["external_data"].blank?
    true
  end
end
