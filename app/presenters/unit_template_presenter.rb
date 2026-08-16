class UnitTemplatePresenter < ShowPresenter
  private

  def edit_path
    edit_unit_template_path(record)
  end

  def record_path
    unit_template_path(record)
  end

  def can_delete?
    true
  end
end
