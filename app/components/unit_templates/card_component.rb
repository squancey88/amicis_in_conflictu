# frozen_string_literal: true

class UnitTemplates::CardComponent < ViewComponent::Base
  delegate :traits_list, to: :helpers

  def initialize(unit_template:)
    @unit_template = unit_template
  end
end
