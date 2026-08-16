module Worlds
  class LocationSerializer < BaseResource
    include Rails.application.routes.url_helpers

    attributes :name

    attribute :edit_path do |resource|
      edit_world_location_path(resource.world, resource)
    end
    attribute :show_path do |resource|
      world_location_path(resource.world, resource)
    end
  end
end
