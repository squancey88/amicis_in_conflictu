module QuestsHelper
  def quest_select(form, attribute_name, world, **)
    bootstrap_field_wrapper(form, attribute_name,
      bootstrapped_collection_select(form, attribute_name, world.quests, label: :title, **))
  end
end
