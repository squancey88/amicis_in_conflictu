# frozen_string_literal: true

class GamingGroupUserOverviewComponent < ViewComponent::Base
  def initialize(gaming_group:)
    @gaming_group = gaming_group
  end

  def name(user)
    return "#{user.fullname} (pending)" if user.pending_invite?
    user.fullname
  end

  def draw_menu(user, membership_text)
    content_tag(:div, class: "dropdown record-show-wrapper_header-menu") do
      concat(content_tag(:button, class: "btn btn-secondary dropdown-toggle", type: :button, data: {
        "bs-toggle": "dropdown"
      }) do
        content_tag(:i, nil, class: "bi bi-gear-fill")
      end)
      concat(content_tag(:ul, class: "dropdown-menu") do
        concat(content_tag(:li, button_to(membership_text, update_membership_gaming_group_path(@gaming_group, {user_id: user.id}), method: :post, class: "dropdown-item")))
        concat(content_tag(:li, button_to("Remove from group", remove_user_gaming_group_path(@gaming_group, {user_id: user.id}), method: :post, class: "dropdown-item")))
      end)
    end
  end
end
