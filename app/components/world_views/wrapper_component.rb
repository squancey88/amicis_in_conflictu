# frozen_string_literal: true

# Layout wrapper for show pages for world items (e.g. locations, characters, articles)
# Will provide some generic styling sections, this is not responsible for access checks
# but will provide an editor panel for users who are world owners
class WorldViews::WrapperComponent < ViewComponent::Base
  delegate :current_user, to: :helpers

  renders_one :header
  renders_one :body
  renders_many :hidden_sections, "HiddenSection"

  def initialize(record:)
    @record = record
    @world = record.world
  end

  class HiddenSection < ViewComponent::Base
    attr_reader :data, :label

    def initialize(label:, data: {})
      @label = label
      @data = data
    end

    def call
      content_tag :div, class: %i[secret-section], data: do
        concat(content_tag(:div, label, class: %i[label]))
        concat(content_tag(:div, content, class: %i[content]))
      end
    end
  end
end
