module Worlds
  module Quests
    class QuestEventSerializer < BaseResource
      include Rails.application.routes.url_helpers

      attributes :title

      attribute :edit_path do |resource|
        edit_world_quest_quest_event_path(resource.world, resource.quest, resource)
      end
      attribute :show_path do |resource|
        world_quest_quest_event_path(resource.world, resource.quest, resource)
      end
    end
  end
end
