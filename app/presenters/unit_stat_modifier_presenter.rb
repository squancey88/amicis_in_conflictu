class UnitStatModifierPresenter < ShowPresenter
  private

  def edit_path
    edit_unit_stat_modifier_path(record)
  end

  def record_path
    unit_stat_modifier_path(record)
  end

  def can_delete?
    true
  end
end
