module UnitStatDefinitionHelper
  def unit_stat_definition_select(game_system, form, attribute_name, data: {})
    selected = form.object.send(attribute_name)
    form.select attribute_name, options_from_collection_for_select(game_system.unit_stat_definitions, :id, :name, selected),
      {include_blank: "Please Select"}, {class: "form-select", data:}
  end

  def unit_stat_definition_type_select(form)
    form.select(:stat_type,
      UnitStatDefinition.stat_types.keys.map { |key| [key.humanize.split.first, key] },
      {}, {class: "form-select"})
  end
end
