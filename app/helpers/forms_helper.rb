module FormsHelper
  def input_field_of_type(type, field_name, name, value = nil, disabled: false)
    case type
    when "number"
      number_field_tag(field_name, value, class: "form-control", placeholder: name, disabled: disabled)
    end
  end

  def bootstrapped_collection_select(form, attribute_name, collection, value: :id, label: :name, data: {}, include_blank: "Please select")
    form.collection_select(attribute_name, collection, value, label,
      {include_blank:}, {class: "form-select", data:})
  end

  def bootstrapped_grouped_collection_select(form, attribute_name, collection, group_method, group_label, option_value: :id, option_label: :name,
    data: {}, include_blank: "Please select")

    form.grouped_collection_select(attribute_name, collection, group_method, group_label, option_value, option_label,
      {include_blank:}, {class: "form-select", data:})
  end
end
