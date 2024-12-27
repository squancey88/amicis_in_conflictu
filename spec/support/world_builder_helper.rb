module WorldBuilderHelper
  def start_world_builder_mode(world = create(:world))
    get start_editing_world_path(world)
  end
end
