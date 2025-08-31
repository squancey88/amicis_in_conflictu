# frozen_string_literal: true

class Organisations::ListItemComponent < Common::ListItemComponent
  def initialize(organisation:)
    super(record: organisation)
    @organisation = organisation
  end

  def display_name
    organisation.name
  end

  def link
    [organisation.world, organisation]
  end

  private

  attr_reader :organisation
end
