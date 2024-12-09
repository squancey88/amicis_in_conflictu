module ArmyListsHelper
  def army_list_select(game_system, form, attribute_name, data: {}, include_blank: "Please Select")
    army_lists = current_user.army_lists.where(game_system:)
    form.collection_select attribute_name, army_lists, :id, :name,
      {include_blank:}, {class: "form-select", data:}
  end

  def bootstrap_army_list_select(game_system, form, attribute_name)
    bootstrap_field_wrapper(form, attribute_name, army_list_select(game_system, form, attribute_name))
  end
end
