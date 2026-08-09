class GamingSessionPresenter < ShowPresenter
  include Rails.application.routes.url_helpers

  def title
    I18n.l(record.start_time)
  end

  def subtitle
    record.gaming_group.name
  end

  def menu_options
    options = [
      {
        text: "Edit",
        link: edit_gaming_group_gaming_session_path(record.gaming_group, record)
      }
    ]
    unless record.games.any?
      options << {
        text: "Delete",
        link: gaming_group_gaming_session_path(record.gaming_group, record),
        data: {turbo_method: :delete, turbo_confirm: "Are you sure?"}
      }
    end
    options
  end
end
