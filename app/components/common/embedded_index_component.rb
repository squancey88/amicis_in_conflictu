# frozen_string_literal: true

class Common::EmbeddedIndexComponent < ViewComponent::Base
  def initialize(title:, turbo_frame_id:, records_path:, new_path:)
    @title = title
    @turbo_frame_id = turbo_frame_id
    @records_path = records_path
    @new_path = new_path
  end
end
