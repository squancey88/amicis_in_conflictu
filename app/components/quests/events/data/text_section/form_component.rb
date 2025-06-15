# frozen_string_literal: true

class Quests::Events::Data::TextSection::FormComponent < Quests::Events::Data::BaseFormComponent
  delegate :bootstrap_text_form,
    to: :helpers

  def initialize(form:)
    super(form:, icon: "journal-text")
  end
end
