# frozen_string_literal: true

class Common::TabsSectionComponent < ViewComponent::Base
  renders_many :tabs, Common::TabComponent

  def initialize(selected_index: 0)
    @id = SecureRandom.hex(6)
    @selected_index = selected_index
  end

  def before_render
    tabs[@selected_index].selected = true
  end
end
