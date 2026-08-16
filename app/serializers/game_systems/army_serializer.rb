module GameSystems
  class ArmySerializer < BaseResource
    include Rails.application.routes.url_helpers

    attributes :name

    attribute :edit_path do |resource|
      edit_army_path(resource)
    end
    attribute :show_path do |resource|
      army_path(resource)
    end
  end
end
