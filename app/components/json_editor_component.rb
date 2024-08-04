# frozen_string_literal: true

class JsonEditorComponent < ViewComponent::Base
  def initialize(model:, attribute:, schema:)
    @model = model
    @attribute = attribute
    @schema = schema
  end

  def json_data
    data = @model.send(@attribute)
    return data if data
    {}
  end
end
