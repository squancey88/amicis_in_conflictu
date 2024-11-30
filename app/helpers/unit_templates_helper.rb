module UnitTemplatesHelper
  def unit_templates_select(game_system, form, attribute_name, data: {})
    form.collection_select attribute_name, game_system.unit_templates.order(:name), :id, :name,
      {include_blank: "Please Select"}, {class: "form-select", data:}
  end

  def bootstrap_unit_templates_select(game_system, form, attribute_name, data: {})
    bootstrap_field_wrapper(form, attribute_name, unit_templates_select(game_system, form, attribute_name))
  end
end
