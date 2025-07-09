# frozen_string_literal: true

class Common::GridBoxComponent < ViewComponent::Base
  delegate :span_to_aic_grid_class, to: :helpers

  erb_template <<~ERB
    <% if @as_box %>
      <%= content_tag :div, class: col_class do %>
        <%= render StandardLayoutBoxComponent.new(**@box_options) do %>
          <%= content %>
        <% end %>
      <% end %>
    <% else %>
      <%= content_tag :div, content, class: col_class %>
    <% end %>
  ERB

  def initialize(span: nil, as_box: false, **box_options)
    @span = span&.to_sym
    @as_box = as_box
    @box_options = box_options
  end

  def col_class = span_to_aic_grid_class(@span)
end
