module Api
  module Worlds
    module Quests
      class QuestEventsController < BaseController
        before_action :set_world
        before_action :set_quest

        def index
          @pagy, @records = pagy(@quest.quest_events)
          render json: {
            records: ::Worlds::Quests::QuestEventSerializer.new(@records).serializable_hash,
            pagination: @pagy.data_hash
          }
        end

        private

        def set_world
          @world = World.find(params[:world_id])
        end

        def set_quest
          @quest = Quest.find(params[:quest_id])
        end
      end
    end
  end
end
