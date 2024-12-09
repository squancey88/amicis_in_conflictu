class PlayersController < ApplicationController
  before_action :set_player, only: %i[update add_army_row]
  before_action :set_game_system, only: %i[add_army_row]

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to game_url(@player.game), notice: "player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_army_row
    helpers.fields Game.new do |game_form|
      game_form.fields_for :players, @player, child_index: params[:player_index] do |f|
        f.fields_for :player_armies, PlayerArmy.new, child_index: Time.now.to_i do |ff|
          render turbo_stream: turbo_stream.append(
            :player_armies,
            partial: "player_armies/form_row",
            locals: {form: ff, game_system: @game_system}
          )
        end
      end
    end
  end

  private

  def set_game_system
    @game_system = GameSystem.find(params[:game_system_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def player_params
    params.require(:player).permit(:id, :notes, player_armies_attributes: [:id, :army_id, :army_list_id, :_destroy])
  end
end
