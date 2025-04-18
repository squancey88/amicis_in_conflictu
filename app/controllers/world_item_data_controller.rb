class WorldItemDataController < ApplicationController
  before_action :setup_data

  def new_text_section
    helpers.fields @model.new do |f|
      f.fields_for @attribute, WorldItemData::TextSection.new, child_index: Time.now.to_i do |ff|
        render turbo_stream: turbo_stream.append(
          "text_sections", WorldItemData::Forms::TextSectionComponent.new(form: ff)
        )
      end
    end
  end

  private

  def setup_data
    @model = params[:model].classify.constantize
    @attribute = params[:attribute]
  end
end
