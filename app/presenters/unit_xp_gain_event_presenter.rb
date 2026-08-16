class UnitXpGainEventPresenter < ShowPresenter
  private

  def edit_path
    edit_unit_xp_gain_event_path(record)
  end

  def record_path
    unit_xp_gain_event_path(record)
  end

  def can_delete?
    true
  end
end
