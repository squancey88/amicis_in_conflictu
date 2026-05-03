module WorldItemDatumHelper
  def visiblity_select(form, data: {})
    form.select(:visibility, WorldItemDatum.visibilities.keys.map { |k| [k.humanize, k] },
      {}, {class: "form-select", data:})
  end
end
