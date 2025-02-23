module UnitStatModifiersHelper
  def unit_stat_modifier_select(form, game_system, attribute_name, data: {})
    bootstrap_field_wrapper(form, attribute_name,
      form.collection_select(attribute_name, game_system.unit_stat_modifiers.active.order(:name), :id, :name,
        {include_blank: "Please Select"}, {class: "form-select", data:}))
  end

  def unit_modifiers_list(record)
    content_tag :div, class: "modifiers-list mt-1" do
      concat(content_tag(:strong, "Modifiers:", class: "me-1"))
      concat(content_tag(:span, record.unit_stat_modifiers.order(:name).map(&:name).join(", ")))
    end
  end
end
