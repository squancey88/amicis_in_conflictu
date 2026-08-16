class ArmyListPresenter < ShowPresenter
  private

  def edit_path
    edit_army_list_path(record)
  end

  def record_path
    army_list_path(record)
  end

  def can_delete?
    true
  end
end
