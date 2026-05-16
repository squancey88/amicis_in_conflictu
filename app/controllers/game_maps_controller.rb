class GameMapsController < ApplicationController
  before_action :set_game_map, only: %i[show edit update destroy]

  # GET /game_maps or /game_maps.json
  def index
    @game_maps = GameMap.all
  end

  # GET /game_maps/1 or /game_maps/1.json
  def show
  end

  # GET /game_maps/new
  def new
    @game_map = GameMap.new
  end

  # GET /game_maps/1/edit
  def edit
  end

  # POST /game_maps or /game_maps.json
  def create
    @game_map = GameMap.new(game_map_params)
    @game_map.owner = current_user

    respond_to do |format|
      if @game_map.save
        format.html { redirect_to @game_map, notice: "Game map was successfully created." }
      else
        format.html { render :new, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /game_maps/1 or /game_maps/1.json
  def update
    respond_to do |format|
      if @game_map.update(game_map_params)
        format.html { redirect_to @game_map, notice: "Game map was successfully updated.", status: :see_other }
      else
        format.html { render :edit, status: :unprocessable_content }
      end
    end
  end

  # DELETE /game_maps/1 or /game_maps/1.json
  def destroy
    @game_map.destroy!
    redirect_to game_maps_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game_map
    @game_map = GameMap.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_map_params
    params.fetch(:game_map, {}).permit(:map_type, :name, config: {})
  end
end
