class UnitTraitPresenter < ShowPresenter
  private

  def edit_path
    edit_unit_trait_path(record)
  end

  def record_path
    unit_trait_path(record)
  end

  def can_delete?
    true
  end
end
