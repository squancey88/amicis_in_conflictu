module CampaignsHelper
  def campaign_select(form, attribute_name, gaming_group, data: {})
    form.collection_select attribute_name, gaming_group.campaigns, {include_blank: "Please Select"}, {class: "form-select", data:}
  end
end
