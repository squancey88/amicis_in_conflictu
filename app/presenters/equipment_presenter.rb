class EquipmentPresenter < ShowPresenter
  private

  def edit_path
    edit_equipment_path(record)
  end

  def record_path
    equipment_path(record)
  end

  def can_delete?
    true
  end
end
