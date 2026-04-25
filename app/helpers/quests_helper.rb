module QuestsHelper
  def quest_select(form, attribute_name, world, **)
    form.collection_select(attribute_name, world.quests, :id, :name, **)
  end
end
