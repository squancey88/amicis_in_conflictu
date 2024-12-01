# frozen_string_literal: true

class EquipmentAttachments::ListComponent < ViewComponent::Base
  delegate :bootstrap_equipment_select, to: :helpers

  def initialize(army_list:)
    @army_list = army_list
  end
end
