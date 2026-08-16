class TimePeriodPresenter < ShowPresenter
  private

  def edit_path
    edit_world_time_period_path(record.world, record)
  end

  def record_path
    world_time_period_path(record.world, record)
  end

  def can_delete?
    true
  end
end
