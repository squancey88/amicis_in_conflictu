module EquipmentHelper
  def equipment_select(game_system, form, attribute_name, data: {})
    form.collection_select attribute_name, game_system.equipment.order(:name), :id, :name,
      {include_blank: "Please Select"}, {class: "form-select", data:}
  end

  def bootstrap_equipment_select(game_system, form, attribute_name, data: {})
    bootstrap_field_wrapper(form, attribute_name, equipment_select(game_system, form, attribute_name))
  end
end
