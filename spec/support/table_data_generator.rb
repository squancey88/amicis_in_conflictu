module TableContentGenerator
  def generate_table_external_data(id, players)
    {
      aic_id: id,
      players: players.map_with_index { |player, index|
        {
          name: player.name,
          aic_id: player.id,
          table_seat: index + 1
        }
      },
      started: DateTime.now.to_s,
      data_version: "v1",
      start_health: 40,
      turn_tracking: [],
      health_changes: []
    }
  end
end
