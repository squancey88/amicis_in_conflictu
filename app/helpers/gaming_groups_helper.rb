module GamingGroupsHelper
  def select_for_groups form, field
    form.select field, current_user.gaming_groups.map { |gg| [gg.name, gg.id] }, {}, {class: "form-select form-control"}
  end
end
