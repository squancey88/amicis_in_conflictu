# frozen_string_literal: true

module Common
  class ReactTabsComponent < ViewComponent::Base
    delegate :react_component, to: :helpers
    renders_many :tab_panels, "Common::ReactTabsComponent::TabPanel"

    def initialize(group_id: SecureRandom.hex(6))
      @group_id = group_id
    end

    def tabs
      tab_panels.map { {id: _1.panel_id, label: _1.label} }
    end

    def before_render
      set_visible
    end

    def call
      safe_join([
        react_component("Tabs", {tabs:, group_id:}),
        content_tag(:div, class: "tab-panel-group", data: {tab_panel_group: group_id}) { safe_join(tab_panels) }
      ])
    end

    private

    def set_visible
      return if tab_panels.any?(:visible)
      tab_panels.first.visible = true
    end

    attr_accessor :group_id

    class TabPanel < ViewComponent::Base
      def initialize(label:, panel_id: SecureRandom.hex(6), visible: false)
        @label = label
        @panel_id = panel_id
        @visible = visible
      end

      def classes
        classes = ["tab-panel"]
        classes << "active-panel" if visible
        classes
      end

      def call
        content_tag :div, class: classes, data: {tab_panel: panel_id} do
          content
        end
      end

      attr_accessor :visible, :panel_id, :label
    end
  end
end
