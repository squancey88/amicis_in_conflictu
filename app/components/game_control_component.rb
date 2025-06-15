# frozen_string_literal: true

class GameControlComponent < ViewComponent::Base
  delegate :turbo_frame_tag, :bs_icon_button,
    :bs_custom_icon_button,
    to: :helpers

  attr_accessor :game, :player

  def initialize(game:, player:)
    @game = game
    @player = player
  end

  def text_editor_search_params
    {}.tap do |hash|
      hash[:campaign_id] = game.campaign_id if game.campaign
    end
  end

  class WindowComponent < ViewComponent::Base
    def initialize(title:, target:, show: true)
      @title = title
      @show = show
      @target = target
    end

    def classes
      ["game-control__sub-window"].tap do |arr|
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
        concat(content_tag(:div, class: "game-control__sub-window-box card") do
          concat(content_tag(:div, @title, class: "game-control__sub-window-header card-header"))
          concat(content_tag(:div, content, class: "game-control__sub-window-body p-2"))
        end)
        concat(content_tag(:div, nil, class: "game-control__sub-window-handle"))
      end
    end
  end
end
