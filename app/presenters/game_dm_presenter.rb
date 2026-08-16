class GameDmPresenter < ShowPresenter
  def title
    record.campaign.name
  end

  def subtitle
    record.campaign_session_number
  end
end
