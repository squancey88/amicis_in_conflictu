module GamesHelper
  def players_html(game)
    player_html_array = game.players.map do |player|
      classes = ["badge"]
      classes << if player.won?
        "text-bg-success"
      else
        "text-bg-secondary"
      end
      content_tag(:div, player.display_name, class: classes, title: army_list_str(player))
    end
    player_html_array.join(content_tag(:div, "vs")).html_safe
  end

  def players_attributes_form_name(player_index, param_string)
    "game[players_attributes][#{player_index}]#{param_string}"
  end

  def state_select(form, classes: [])
    content_tag(:div, class: classes + ["form-floating"]) do
      concat(form.select(:game_state, Game.game_states.keys.map { |key| [key.humanize, key] }, {}, {class: "form-select"}))
      concat(form.label(:game_state))
    end
  end

  def state_badge(game)
    classes = ["badge"]
    classes << "text-bg-success" if game.finished?
    classes << "text-bg-danger" if game.cancelled?
    classes << "text-bg-warning" if game.in_progress?
    classes << "text-bg-info" if game.not_played?
    content_tag(:span, game.game_state.humanize, class: classes)
  end
end
