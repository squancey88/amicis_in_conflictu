class CharacterSerializer < BaseSerializer
  private

  def columns
    %i[given_name family_name physical_description_plain_text history_plain_text]
  end

  def additional_values(item)
    {
      species: item.species.name,
      type: item.character_type.name,
      custom_fields: item.custom_fields_with_labels
    }
  end
end
