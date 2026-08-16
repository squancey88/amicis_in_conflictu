class WorldPresenter < ShowPresenter
  private

  def edit_path
    edit_world_path(record)
  end

  def record_path
    world_path(record)
  end

  def can_delete?
    true
  end
end
