module UserHelper
  def gaming_group_user_select(gaming_group, form, attribute_name, **)
    form.collection_select(attribute_name, gaming_group.users, :id, :display_name, **)
  end
end
