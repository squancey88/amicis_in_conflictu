module WorldsHelper
  def current_world
    World.find(session[:world_id].presence || params[:world_id]) if session[:world_id] || params[:world_id]
  end

  def world_select_for_group(gaming_group, form, attribute_name, **)
    form.grouped_collection_select(attribute_name, gaming_group.users,
      :worlds, :display_name, **)
  end

  def world_select(form, attribute_name, **)
    form.collection_select(attribute_name, World.all, :id, :name, **)
  end
end
