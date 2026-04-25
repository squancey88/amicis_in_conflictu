module OrganisationsHelper
  def organisation_type_select(form, attribute_name, world, data: {}, include_blank: true)
    form.collection_select(attribute_name, world.organisation_types, :id, :name,
      {include_blank:}, {class: "form-select", data:})
  end
end
