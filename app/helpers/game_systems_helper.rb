module GameSystemsHelper
  def game_system_select(form, attribute_name)
    form.select attribute_name, grouped_options_for_select(game_system_grouped_options(GameSystem.all)), {}, {class: "form-select"}
  end

  def game_systems_with_army_select(form, attribute_name)
    form.select attribute_name, grouped_options_for_select(game_system_grouped_options(GameSystem.where(has_armies: true))), {}, {class: "form-select"}
  end

  def game_system_grouped_options game_systems
    game_systems.group_by(&:category).each_with_object([]) do |(k, v), m|
      m << [k, v.map { |x| [x.display_name, x.id] }]
    end
  end

  def finish_reason_select(game_system, form, attribute_name, classes: [], disabled: false)
    content_tag(:div, class: classes + ["form-floating"]) do
      concat(form.select(attribute_name, game_system.finish_reasons,
        {include_blank: "== Select Reason for Finish =="}, {class: "form-select", disabled:}))
      concat(form.label(attribute_name))
    end
  end
end
