module UnitTraitsHelper
  def unit_traits_select(game_system, form, attribute_name, data: {})
    form.collection_select attribute_name, game_system.unit_traits.order(:name), :id, :name,
      {include_blank: "Please Select"}, {class: "form-select", data:}
  end

  def bootstrap_unit_traits_select(game_system, form, attribute_name, data: {})
    bootstrap_field_wrapper(form, attribute_name, unit_traits_select(game_system, form, attribute_name))
  end

  def traits_list(model)
    content_tag :div, class: "trait-list mt-1" do
      concat(content_tag(:strong, "Traits:", class: "me-1"))
      concat(content_tag(:span, model.unit_traits.order(:name).map(&:name).join(", ")))
    end
  end
end
