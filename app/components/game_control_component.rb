# frozen_string_literal: true

class GameControlComponent < ViewComponent::Base
  delegate :turbo_frame_tag, :bs_icon_button,
    :bs_custom_icon_button,
    to: :helpers

  def initialize(game:, player:)
    @game = game
    @player = player
  end

  class WindowComponent < ViewComponent::Base
    def initialize(title:, target:, show: true)
      @title = title
      @show = show
      @target = target
    end

    def classes
      ["game-control__sub-window card"].tap do |arr|
        arr << "show" if @show
      end
    end

    def data
      {
        "game-control-target": @target
      }
    end

    def call
      content_tag :div, class: classes, data: do
        concat(content_tag(:div, @title, class: "game-control__sub-window-header card-header"))
        concat(content_tag(:div, content, class: "game-control__sub-window-body p-2"))
      end
    end
  end
end
