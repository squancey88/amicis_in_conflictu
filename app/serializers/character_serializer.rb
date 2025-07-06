class CharacterSerializer < BaseSerializer
  private

  def serialize_single(character)
    attributes = {}

    attributes[:id] = character.id if include_attribute?(:id)
    attributes[:given_name] = character.given_name if include_attribute?(:given_name)
    attributes[:family_name] = character.family_name if include_attribute?(:family_name)

    attributes
  end
end
