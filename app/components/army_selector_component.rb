# frozen_string_literal: true

class ArmySelectorComponent < ViewComponent::Base
  def initialize(player:)
    @player = player
  end

  def army_select
    options = if @player.controller_type == "User"
      options_for_select(@player.controller.armies.where(game_system: @player.game.game_system).map { [_1.name, _1.id, {data: {has_lists: _1.can_have_lists?}}] })
    else
      data = @player.controller.users.each_with_object([]) do |user, list|
        list << [user.display_name, user.armies.where(game_system: @player.game.game_system).map { [_1.name, _1.id, {data: {has_lists: _1.can_have_lists?}}] }]
      end
      grouped_options_for_select(data)
    end
    select_tag("army-select", options, include_blank: "== Select Army ==", class: "form-select", data: {army_selector_target: "armySelect"})
  end
end
