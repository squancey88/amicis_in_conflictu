class GameObjectivesController < ApplicationController
  before_action :set_game_objective, only: %i[ show edit update destroy ]

  # GET /game_objectives or /game_objectives.json
  def index
    @game_objectives = GameObjective.all
  end

  # GET /game_objectives/1 or /game_objectives/1.json
  def show
  end

  # GET /game_objectives/new
  def new
    @game_objective = GameObjective.new
  end

  # GET /game_objectives/1/edit
  def edit
  end

  # POST /game_objectives or /game_objectives.json
  def create
    @game_objective = GameObjective.new(game_objective_params)

    respond_to do |format|
      if @game_objective.save
        format.html { redirect_to @game_objective, notice: "Game objective was successfully created." }
        format.json { render :show, status: :created, location: @game_objective }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_objectives/1 or /game_objectives/1.json
  def update
    respond_to do |format|
      if @game_objective.update(game_objective_params)
        format.html { redirect_to @game_objective, notice: "Game objective was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @game_objective }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_objectives/1 or /game_objectives/1.json
  def destroy
    @game_objective.destroy!

    respond_to do |format|
      format.html { redirect_to game_objectives_path, notice: "Game objective was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_objective
      @game_objective = GameObjective.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_objective_params
      params.fetch(:game_objective, {})
    end
end
