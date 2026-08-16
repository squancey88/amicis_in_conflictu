class GamingSessionPresenter < ShowPresenter
  def title
    I18n.l(record.start_time)
  end

  def subtitle
    record.gaming_group.name
  end

  private

  def edit_path
    edit_gaming_group_gaming_session_path(record.gaming_group, record)
  end

  def record_path
    gaming_group_gaming_session_path(record.gaming_group, record)
  end

  def can_delete?
    record.games.any?
  end
end
