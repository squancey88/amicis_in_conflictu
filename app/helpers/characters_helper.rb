module CharactersHelper
  def character_type_select(form, attribute_name, world, data: {}, include_blank: true)
    form.collection_select(attribute_name, world.character_types, :id, :name,
      {include_blank:, label: "Type"}, {class: "form-select", data:})
  end

  def character_species_type_select(form, attribute_name, world, data: {}, include_blank: true)
    form.collection_select(attribute_name, world.character_species_types, :id, :name,
      {include_blank:, label: "Species"}, {class: "form-select", data:})
  end

  def character_custom_field(form, field_data, character)
    case field_data["type"]
    when "string"
      form.text_field(field_data["key"],
        class: "form-control",
        value: character.config[field_data["key"]],
        label: field_data["name"],
        required: field_data["required"])
    when "integer"
      form.number_field(field_data["key"],
        class: "form-control",
        value: character.config[field_data["key"]],
        label: field_data["name"],
        required: field_data["required"])
    when "boolean"
      begin
        value = character.config[field_data["key"]] == "1" # Deal with fact its number in jsonb rather than bool
      rescue
        value = nil
      end
      form.check_box(field_data["key"], value: value, label: field_data["name"])
    when "array"
      render(Forms::ArrayFieldComponent.new(form:, field: field_data["key"], label: field_data["name"],
        required: field_data["required"]))
    end
  end
end
