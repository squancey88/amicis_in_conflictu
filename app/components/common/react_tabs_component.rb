# frozen_string_literal: true

class Common::ReactTabsComponent < ViewComponent::Base
  delegate :react_component, to: :helpers
  renders_many :tab_panels

  def initialize(tabs:, group_id:)
    @tabs = tabs
    @group_id = group_id
  end
end
