# frozen_string_literal: true

module Common
  class ReactTabsComponent < ViewComponent::Base
    delegate :react_component, to: :helpers
    renders_many :tab_panels, "Common::ReactTabsComponent::TabPanel"

    def initialize(tabs:, group_id:)
      @tabs = tabs
      @group_id = group_id
    end

    def call
      safe_join([
        react_component("Tabs", {tabs:, group_id:}),
        content_tag(:div, class: "tab-panel-group", data: {tab_panel_group: group_id}) { safe_join(tab_panels) }
      ])
    end

    private

    attr_accessor :tabs, :group_id

    class TabPanel < ViewComponent::Base
      def initialize(panel_id:, visible: false)
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

      private

      attr_accessor :visible, :panel_id
    end
  end
end
