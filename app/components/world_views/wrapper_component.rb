# frozen_string_literal: true

# Layout wrapper for show pages for world items (e.g. locations, characters, articles)
# Will provide some generic styling sections, this is not responsible for access checks
# but will provide an editor panel for users who are world owners
class WorldViews::WrapperComponent < ViewComponent::Base
  delegate :current_user, to: :helpers

  renders_one :header
  renders_one :body

  def initialize(record:)
    @record = record
    @world = record.world
  end
end
