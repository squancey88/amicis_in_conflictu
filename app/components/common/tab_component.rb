# frozen_string_literal: true

class Common::TabComponent < ViewComponent::Base
  attr_reader :id, :label
  attr_accessor :selected

  renders_many :grid_boxes, Common::GridBoxComponent

  def initialize(label:, row_cols: 2)
    @label = label
    @id = "#{label.parameterize}-#{SecureRandom.hex}"
    @row_cols = row_cols
    @selected = false
  end

  def button_classes
    classes = %w[nav-link]
    classes << "active" if @selected
    classes
  end

  def tab_classes
    classes = %w[tab-pane fade]
    classes += %w[show active] if @selected
    classes
  end

  def tab_html
    content_tag :li, role: :presentation, class: %w[nav-item] do
      content_tag :button, label, class: button_classes, id: "#{id}-tab",
        data: {bs_toggle: :tab, bs_target: "##{id}"}, type: :button,
        aria: {controls: label, selected: @selected}
    end
  end
end
