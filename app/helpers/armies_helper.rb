module ArmiesHelper
  def army_select(game_system, form, attribute_name, data: {}, include_blank: "Please Select")
    bootstrapped_collection_select(form, attribute_name, game_system.armies, data:, include_blank:)
  end

  def bootstrap_army_select(game_system, form, attribute_name)
    bootstrap_field_wrapper(form, attribute_name, army_select(game_system, form, attribute_name))
  end
end
