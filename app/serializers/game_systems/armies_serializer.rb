module GameSystems
  class ArmiesSerializer
    include Alba::Resource
    include Rails.application.routes.url_helpers

    attributes :id, :name, :created_at, :updated_at

    attribute :edit_path do |resource|
      edit_army_path(resource)
    end
    attribute :show_path do |resource|
      army_path(resource)
    end
  end
end
