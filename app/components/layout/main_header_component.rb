# frozen_string_literal: true

class Layout::MainHeaderComponent < ViewComponent::Base
  delegate :current_user, :react_component, to: :helpers

  def render?
    !current_user.nil?
  end

  def menu_links
    links = []
    links << {
      label: "My groups",
      items: current_user.gaming_groups.map do |group|
        {label: group.name, href: gaming_group_path(group)}
      end
    }

    all_items.each do |item|
      next unless see_link(item)
      links << item.slice(:label, :href)
    end
    links
  end

  private

  def see_link(menu_item)
    if current_user.admin
      true
    else
      !menu_item[:admin_only]
    end
  end

  def all_items
    [
      {label: "My Lists", href: army_lists_path, admin_only: false},
      {label: "My Characters", href: characters_user_path(current_user), admin_only: false},
      {label: "My Worlds", href: worlds_path, admin_only: false},
      {label: "Game Systems", href: game_systems_path, admin_only: true}
    ]
  end
end
