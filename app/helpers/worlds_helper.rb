module WorldsHelper
  def current_world
    World.find(session[:world_id].presence || params[:world_id]) if session[:world_id] || params[:world_id]
  end

  def world_select_for_group(gaming_group, form, attribute_name, **)
    bootstrap_field_wrapper(form, attribute_name,
      bootstrapped_grouped_collection_select(form, attribute_name, gaming_group.users,
        :worlds, :display_name, **))
  end

  def world_select(form, attribute_name, **)
    bootstrap_field_wrapper(form, attribute_name,
      bootstrapped_collection_select(form, attribute_name, World.all, **))
  end
end
