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
end
