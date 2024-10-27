json.extract! campaign, :id, :name, :gaming_group_id, :game_system_id, :created_at, :updated_at
json.url gaming_group_campaign_url(@gaming_group, campaign, format: :json)
