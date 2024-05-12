module PlayersHelper
  def army_list_str(player)
    player.player_armies.map { army_name(_1) }.join(" &amp; ")
  end

  def army_name(player_army)
    return "#{player_army.army.name} (#{player_army.army_list.name})" if player_army.army_list
    player_army.army.name
  end

  def winner_badge(player)
    content_tag(:div, player.display_name, class: ["badge", "text-bg-success"], title: army_list_str(player))
  end
end
