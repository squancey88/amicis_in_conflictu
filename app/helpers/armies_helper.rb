module ArmiesHelper
  def army_select(game_system, form, attribute_name, data: {}, include_blank: "Please Select")
    form.collection_select(attribute_name, game_system.armies, :id, :name, data:, include_blank:)
  end
end
