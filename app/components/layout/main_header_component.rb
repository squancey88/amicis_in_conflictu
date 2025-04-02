# frozen_string_literal: true

class Layout::MainHeaderComponent < ViewComponent::Base
  delegate :current_user, to: :helpers

  def render?
    !current_user.nil?
  end

  def menu_links
    [
      {name: "My Lists", url: army_lists_path, admin_only: false},
      {name: "My Characters", url: my_characters_path, admin_only: false},
      {name: "My Worlds", url: worlds_path, admin_only: false},
      {name: "Game Systems", url: game_systems_path, admin_only: true}
    ]
  end

  def see_link(menu_item)
    if current_user.admin
      true
    else
      !menu_item[:admin_only]
    end
  end
end
