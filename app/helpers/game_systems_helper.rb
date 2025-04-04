module GameSystemsHelper
  def game_system_select(form, attribute_name, data: {})
    selected = form.object.send(attribute_name) if form.object
    form.select attribute_name,
      grouped_options_for_select(game_system_grouped_options(GameSystem.all), selected),
      {include_blank: "Please Select"}, {class: "form-select", data:}
  end

  def bootstrap_game_system_select(form, attribute_name, data: {})
    bootstrap_field_wrapper(form, attribute_name, game_system_select(form, attribute_name))
  end

  def game_systems_with_army_select(form, attribute_name, include_blank: nil)
    options = {}
    options[:include_blank] = include_blank if include_blank
    form.select attribute_name,
      grouped_options_for_select(game_system_grouped_options(GameSystem.where(has_armies: true))),
      options, {class: "form-select"}
  end

  def game_systems_with_army_lists_select(form, attribute_name, include_blank: nil, data: {})
    options = {}
    options[:include_blank] = include_blank if include_blank
    selected = form.object.send(attribute_name) if form.object
    form.select attribute_name,
      grouped_options_for_select(game_system_grouped_options(GameSystem.where(has_army_lists: true)), selected),
      options,
      {class: "form-select", data:}
  end

  def game_system_grouped_options(game_systems)
    game_systems.group_by(&:category).each_with_object([]) do |(k, v), m|
      m << [k, v.map { |x| [x.display_name, x.id] }]
    end
  end

  def finish_reason_select(game_system, form, attribute_name, classes: [], disabled: false, data: {})
    content_tag(:div, class: classes + ["form-floating"]) do
      concat(form.select(attribute_name, game_system.finish_reasons,
        {include_blank: "== Select Reason for Finish =="}, {class: "form-select", disabled:, data:}))
      concat(form.label(attribute_name))
    end
  end

  def game_system_edit_path(game_system)
    case game_system
    when GameSystems::Wargame
      edit_game_systems_wargame_path(game_system)
    when GameSystems::CardGame
      edit_game_systems_card_game_path(game_system)
    when GameSystems::RolePlayingGame
      edit_game_systems_role_playing_game_path(game_system)
    end
  end

  def game_system_show_path(game_system)
    case game_system
    when GameSystems::Wargame
      game_systems_wargame_path(game_system)
    when GameSystems::CardGame
      game_systems_card_game_path(game_system)
    when GameSystems::RolePlayingGame
      game_systems_role_playing_game_path(game_system)
    end
  end
end
