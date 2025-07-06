module LocationsHelper
  def location_type_select(form, attribute_name, world, data: {}, include_blank: true)
    bootstrap_field_wrapper(form, attribute_name,
      form.collection_select(attribute_name, world.location_types, :id, :name,
        {include_blank:}, {class: "form-select", data:}), label: "Type")
  end

  def located_in_select(form, attribute_name, world, data: {}, include_blank: true)
    current = form.object.send(:id)
    location_array = locations_to_options(current, world.locations.where(located_in: nil))

    bootstrap_field_wrapper(form, attribute_name,
      form.select(attribute_name, options_for_select(location_array, selected: form.object.send(attribute_name), disabled: current), {include_blank:}, {class: "form-select", data:}))
  end

  def locations_to_options(current, locations, level: 0, array: [])
    locations.each_with_object(array) do |location, arr|
      arr << ["#{"--" * level} #{location.name}", location.id]
      locations_to_options(current, location.locations, level: level + 1, array: arr) if location.locations.any?
    end
  end
end
