module CampaignsHelper
  def campaign_select(form, attribute_name, gaming_group, data: {})
    form.collection_select attribute_name, gaming_group.campaigns, {include_blank: "Please Select"}, {class: "form-select", data:}
  end

  def campaigns_grouped_by_game_system(gaming_group)
    gaming_group.campaigns.includes(:game_system).each_with_object([]) do |campaign, arr|
      exists = arr.find { _1[:game_system_id] == campaign.game_system.id }
      if exists
        exists[:campaigns] << {id: campaign.id, name: campaign.name}
      else
        arr << {
          game_system_id: campaign.game_system.id,
          campaigns: [{id: campaign.id, name: campaign.name}]
        }
      end
    end
  end
end
