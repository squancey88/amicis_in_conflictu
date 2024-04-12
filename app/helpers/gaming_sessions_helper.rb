module GamingSessionsHelper
  def member_selection(gaming_group, name, options = {})
    select_tag(name, options_from_collection_for_select(gaming_group.users, :id, :display_name), options)
  end

  def team_selection(gaming_group, name, options = {})
    select_tag(name, options_from_collection_for_select(gaming_group.teams, :id, :display_name), options)
  end

  def member_select(form, name, gaming_group, options = {})
    form.select(name, gaming_group.users.map { [_1.display_name, _1.id] }, options)
  end

  def player_select(form, name, gaming_group, options = {}, html_options = {})
    form.select(name, gaming_group.players, options, html_options)
  end

  def player_selection(gaming_group, name, options = {})
    players = {
      Players: gaming_group.users.map { [_1.display_name, _1.id, {data: {controller_type: "User"}}] },
      Teams: gaming_group.teams.map { [_1.display_name, _1.id, {data: {controller_type: "Team"}}] }
    }
    select_tag(name, grouped_options_for_select(players), options)
  end
end
