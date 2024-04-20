module GamingSessionsHelper
  def member_select(form, name, gaming_group, options = {}, html_options = {})
    form.select(name, gaming_group.users.map { [_1.display_name, _1.id] }, options, html_options)
  end

  def player_selection(gaming_group, name, options = {})
    players = {
      Players: gaming_group.users.map { [_1.display_name, _1.id, {data: {controller_type: "User"}}] },
      Teams: gaming_group.teams.map { [_1.display_name, _1.id, {data: {controller_type: "Team"}}] }
    }
    select_tag(name, grouped_options_for_select(players), options)
  end
end
