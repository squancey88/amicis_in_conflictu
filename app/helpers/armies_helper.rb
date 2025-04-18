module ArmiesHelper
  def army_select(game_system, form, attribute_name, data: {}, include_blank: "Please Select")
    form.collection_select attribute_name, game_system.armies, :id, :name,
      {include_blank:}, {class: "form-select", data:}
  end

  def bootstrap_army_select(game_system, form, attribute_name)
    bootstrap_field_wrapper(form, attribute_name, army_select(game_system, form, attribute_name))
  end
end
