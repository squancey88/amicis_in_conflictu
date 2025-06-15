# frozen_string_literal: true

class WorldItemData::Forms::TextSectionComponent < ViewComponent::Base
  delegate :visiblity_select,
    :bootstrap_text_form,
    to: :helpers

  def initialize(form:)
    @form = form
  end
end
