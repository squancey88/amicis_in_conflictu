# frozen_string_literal: true

class Common::ListItemComponent < ViewComponent::Base
  def initialize(record:)
    @record = record
  end

  def display_name
    raise NotImplementedError
  end

  def link
    raise NotImplementedError
  end

  def subtext
    nil
  end

  def call
    content_tag :li, class: %w[list-group-item] do
      concat(link_to(display_name, link, target: "_top"))
      concat(content_tag(:div, subtext, class: %w[fw-lighter])) if subtext
    end
  end
end
