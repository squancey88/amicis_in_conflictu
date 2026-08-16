module Worlds
  class QuestSerializer < BaseResource
    include Rails.application.routes.url_helpers

    attributes :title

    attribute :edit_path do |resource|
      edit_world_quest_path(resource.world, resource)
    end
    attribute :show_path do |resource|
      world_quest_path(resource.world, resource)
    end
  end
end
