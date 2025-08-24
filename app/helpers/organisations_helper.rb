module OrganisationsHelper
  def organisation_type_select(form, attribute_name, world, data: {}, include_blank: true)
    bootstrap_field_wrapper(form, attribute_name,
      form.collection_select(attribute_name, world.organisation_types, :id, :name,
        {include_blank:}, {class: "form-select", data:}), label: "Type")
  end
end
