module WorldItemDatumHelper
  def visiblity_select(form, data: {})
    bootstrap_field_wrapper(form, :visibility,
      form.select(:visibility, WorldItemDatum.visibilities.keys.map { |k| [k.humanize, k] },
        {}, {class: "form-select", data:}), label: "Visibility")
  end
end
