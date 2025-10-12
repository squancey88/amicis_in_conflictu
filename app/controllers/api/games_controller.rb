module Api
  class GamesController < BaseController
    before_action :set_game, only: %i[show update]
    before_action :has_access, only: %i[show]

    def show
      render json: GameSerializer.new(@game).serialize
    end

    def create
      @game = Game.new(game_params)

      if @game.save
        render json: GameSerializer.new(@game).serialize
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    end

    def update
      if @game.update(game_params)
        render json: GameSerializer.new(@game).serialize
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    end

    private

    def game_params
      params.require(:game).permit(
        :gaming_session_id, :game_system_id, :campaign_id,
        :game_state, :finish_reason,
        data: {},
        players_attributes: [:id, :controller_id, :controller_type, :notes, :surrendered,
          player_armies_attributes: [:id, :army_id, :army_list_id, :_destroy],
          game_data: {}],
        unit_xp_gain_applied_attributes: [:id, :unit_id, :unit_xp_gain_event_id],
        unit_applied_modifier_attributes: [:id, :unit_id, :unit_stat_modifier_id],
        game_quest_events_attributes: [:id, :notes]
      )
    end

    def has_access
      unless @game.gaming_group.is_user?(current_user)
        render json: {error: "Access denied"}, status: :forbidden
      end
    end

    def set_game
      @game = Game.find(params[:id])
    end
  end
end
