# frozen_string_literal: true

class RecordFormWrapperComponent < ViewComponent::Base
  renders_one :fields

  def initialize(record:, form:)
    @record = record
    @form = form
  end
end
