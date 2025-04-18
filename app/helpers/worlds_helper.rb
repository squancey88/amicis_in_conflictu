module WorldsHelper
  def current_world
    World.find(session[:world_id]) if session[:world_id]
  end
end
