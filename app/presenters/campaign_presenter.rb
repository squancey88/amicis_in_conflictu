class CampaignPresenter < ShowPresenter
  def header_buttons
    buttons = []
    if record.world && record.game_system.instance_of?(GameSystem::RolePlayingGame)
      buttons << {
        label: "New Character",
        href: new_world_character_path(record.world, campaign_id: record.id)
      }
    end
    buttons
  end

  private

  def edit_path
    edit_gaming_group_campaign_path(record.gaming_group, record)
  end

  def record_path
    gaming_group_campaign_path(record.gaming_group, record)
  end

  def can_delete?
    true
  end
end
