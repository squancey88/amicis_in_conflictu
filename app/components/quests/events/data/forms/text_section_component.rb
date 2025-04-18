# frozen_string_literal: true

class Quests::Events::Data::Forms::TextSectionComponent < Quests::Events::Data::Forms::BaseComponent
  delegate :bootstrap_text_form,
    to: :helpers

  def initialize(form:)
    super(form:, icon: "journal-text")
  end
end
