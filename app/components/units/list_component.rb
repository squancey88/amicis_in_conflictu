# frozen_string_literal: true

class Units::ListComponent < ViewComponent::Base
  delegate :traits_list, :bootstrap_unit_templates_select, to: :helpers

  def initialize(army_list:)
    @army_list = army_list
  end
end
