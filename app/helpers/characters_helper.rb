module CharactersHelper
  def character_type_select(form, attribute_name, world, data: {}, include_blank: true)
    bootstrap_field_wrapper(form, attribute_name,
      form.collection_select(attribute_name, world.character_types, :id, :name,
        {include_blank:}, {class: "form-select", data:}), label: "Type")
  end

  def character_species_type_select(form, attribute_name, world, data: {}, include_blank: true)
    bootstrap_field_wrapper(form, attribute_name,
      form.collection_select(attribute_name, world.character_species_types, :id, :name,
        {include_blank:}, {class: "form-select", data:}), label: "Species")
  end

  def character_custom_field(form, field_data, character)
    case field_data["type"]
    when "string"
      bootstrap_field_wrapper(
        form,
        field_data["key"],
        form.text_field(field_data["key"],
          class: "form-control",
          value: character.config[field_data["key"]],
          required: field_data["required"]),
        label: field_data["name"]
      )
    when "integer"
      bootstrap_field_wrapper(
        form,
        field_data["key"],
        form.number_field(field_data["key"],
          class: "form-control",
          value: character.config[field_data["key"]],
          required: field_data["required"]),
        label: field_data["name"]
      )
    when "boolean"
      begin
        value = character.config[field_data["key"]] == "1" # Deal with fact its number in jsonb rather than bool
      rescue
        value = nil
      end
      bootstrap_check_box(form, field_data["key"],
        value: value,
        label: field_data["name"],
        margin_bottom: 3)
    when "array"
      render(Forms::ArrayFieldComponent.new(form:, field: field_data["key"], label: field_data["name"],
        required: field_data["required"]))
    end
  end
end
