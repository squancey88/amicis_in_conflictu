module PlayersHelper
  def army_list_str(player)
    player.player_armies.map { army_name(_1) }.join(" &amp; ")
  end

  def army_name(player_army)
    return "#{player_army.army.name} (#{player_army.army_list.name})" if player_army.army_list
    player_army.army.name
  end
end
