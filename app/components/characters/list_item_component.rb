# frozen_string_literal: true

class Characters::ListItemComponent < Common::ListItemComponent
  def initialize(character:)
    super(record: character)
    @character = character
  end

  def display_name
    character.full_name
  end

  def link
    [character.world, character]
  end

  private

  attr_reader :character
end
