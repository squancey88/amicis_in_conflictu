# frozen_string_literal: true

class WorldItemData::Views::TextSectionComponent < WorldItemData::Views::BaseViewComponent
  def initialize(section:)
    super(section)
    @section = section
  end
end
