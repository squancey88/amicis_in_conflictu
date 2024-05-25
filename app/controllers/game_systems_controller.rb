class GameSystemsController < ApplicationController
  before_action :set_game_system, only: %i[show edit update destroy]

  # GET /game_systems or /game_systems.json
  def index
    @game_systems = GameSystem.all
  end

  # GET /game_systems/1 or /game_systems/1.json
  def show
  end

  # GET /game_systems/new
  def new
    @game_system = GameSystem.new
  end

  # GET /game_systems/1/edit
  def edit
  end

  # POST /game_systems or /game_systems.json
  def create
    @game_system = GameSystem.new(game_system_params)
    respond_to do |format|
      if @game_system.save
        format.html { redirect_to game_system_url(@game_system), notice: "Game system was successfully created." }
        format.json { render :show, status: :created, location: @game_system }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_systems/1 or /game_systems/1.json
  def update
    respond_to do |format|
      if @game_system.update(game_system_params)
        format.html { redirect_to game_system_url(@game_system), notice: "Game system was successfully updated." }
        format.json { render :show, status: :ok, location: @game_system }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_systems/1 or /game_systems/1.json
  def destroy
    @game_system.destroy!

    respond_to do |format|
      format.html { redirect_to game_systems_url, notice: "Game system was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game_system
    @game_system = GameSystem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_system_params
    params.require(:game_system).permit(:name, :slug)
  end
end
