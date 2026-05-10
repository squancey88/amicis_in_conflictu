# frozen_string_literal: true

class Common::EmbeddedIndexComponent < ViewComponent::Base
  delegate :react_component, to: :helpers

  def initialize(title:, records_path:, turbo_frame_id: nil, new_path: nil, as_list: false, react: false, display_config: [])
    @title = title
    @turbo_frame_id = turbo_frame_id
    @records_path = records_path
    @new_path = new_path
    @as_list = as_list
    @react = react
    @display_config = display_config

    if @react && @display_config.empty?
      raise StandardError("Invalid config")
    end
  end
end
