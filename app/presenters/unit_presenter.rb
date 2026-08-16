class UnitPresenter < ShowPresenter
  private

  def edit_path
    edit_army_list_unit_path(record.army_list, record)
  end

  def record_path
    army_list_unit_path(record.army_list, record)
  end

  def can_delete?
    true
  end
end
