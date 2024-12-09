# frozen_string_literal: true

class Units::ListComponent < ViewComponent::Base
  delegate :traits_list, :unit_templates_select_grouped_armies, to: :helpers

  def initialize(army_list:)
    @army_list = army_list
  end
end
