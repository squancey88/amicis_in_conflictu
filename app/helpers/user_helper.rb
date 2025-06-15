module UserHelper
  def gaming_group_user_select(gaming_group, form, attribute_name, **)
    bootstrap_field_wrapper(form, attribute_name,
      bootstrapped_collection_select(form, attribute_name, gaming_group.users, label: :display_name, **))
  end
end
