module GamesHelper
  def players_html(game)
    game.players.map(&:display_name).join(" vs ")
  end

  def players_attributes_form_name(player_index, param_string)
    "game[players_attributes][#{player_index}]#{param_string}"
  end

  def state_select form, classes: []
    content_tag(:div, class: classes + ["form-floating"]) do
      concat(form.select(:game_state, Game.game_states.keys.map { |key| [key.humanize, key] }, {}, {class: "form-select"}))
      concat(form.label(:game_state))
    end
  end
end
