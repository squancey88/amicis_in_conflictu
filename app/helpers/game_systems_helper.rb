module GameSystemsHelper
  def game_system_select form, attribute_name
    form.select attribute_name, grouped_options_for_select(game_system_grouped_options), {}, {class: "form-select"}
  end

  def game_system_grouped_options
    GameSystem.all.group_by(&:category).each_with_object([]) do |(k, v), m|
      m << [k, v.map { |x| [x.display_name, x.id] }]
    end
  end
end
