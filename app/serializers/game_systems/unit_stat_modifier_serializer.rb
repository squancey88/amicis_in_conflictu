module GameSystems
  class UnitStatModifierSerializer
    include Alba::Resource
    include Rails.application.routes.url_helpers

    attributes :id, :name, :created_at, :updated_at

    attribute :edit_path do |resource|
      edit_unit_stat_modifier_path(resource)
    end
    attribute :show_path do |resource|
      unit_stat_modifier_path(resource)
    end
  end
end
