# frozen_string_literal: true

class RecordFormWrapperComponent < ViewComponent::Base
  renders_one :fields

  def initialize(record:, form:, title: nil)
    @record = record
    @form = form
    @title = title
  end
end
