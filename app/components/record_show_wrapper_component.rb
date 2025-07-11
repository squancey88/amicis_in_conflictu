# frozen_string_literal: true

class RecordShowWrapperComponent < ViewComponent::Base
  renders_one :body
  renders_many :boxes, StandardLayoutBoxComponent
  renders_many :spaces
  renders_one :header_buttons
  renders_one :tab_section, Common::TabsSectionComponent

  def initialize(record:, title:, menu_options: [], classes: [], row_cols: 2)
    @record = record
    @menu_options = menu_options
    @title = title
    @classes = classes
    @row_cols = row_cols
  end
end
