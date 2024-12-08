module UnitTemplatesHelper
  def unit_templates_select(game_system, form, attribute_name, data: {})
    form.collection_select attribute_name, game_system.unit_templates.order(:name), :id, :name,
      {include_blank: "Please Select"}, {class: "form-select", data:}
  end

  def bootstrap_unit_templates_select(game_system, form, attribute_name, data: {})
    bootstrap_field_wrapper(form, attribute_name, unit_templates_select(game_system, form, attribute_name))
  end

  def unit_templates_select_grouped_armies(game_system, form, attribute_name, data: {})
    bootstrap_field_wrapper(form, attribute_name,
      form.select(attribute_name, grouped_options_unit_templates(game_system),
        {include_blank: "Please Select"}, {class: "form-select", data:}))
  end

  def grouped_options_unit_templates(game_system)
    options = []
    game_system.armies.each do |army|
      options << [army.name, army.unit_templates.collect { [_1.name, _1.id] }]
    end
    options
  end
end
