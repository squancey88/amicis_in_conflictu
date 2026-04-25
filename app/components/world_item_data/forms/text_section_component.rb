# frozen_string_literal: true

class WorldItemData::Forms::TextSectionComponent < ViewComponent::Base
  delegate :visiblity_select,
    to: :helpers

  def initialize(form:)
    @form = form
  end
end
