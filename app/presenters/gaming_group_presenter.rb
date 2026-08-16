class GamingGroupPresenter < ShowPresenter
  def title
    record.name
  end

  private

  def edit_path
    edit_gaming_group_path(record)
  end

  def record_path
    gaming_group_path(record)
  end

  def can_delete?
    false
  end
end
