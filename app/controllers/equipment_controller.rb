class EquipmentController < ApplicationController
  before_action :set_game_system, only: %i[new index]
  before_action :set_equipment, only: %i[show edit update destroy]

  # GET /equipment or /equipment.json
  def index
    @pagy, @equipment = pagy(@game_system.equipment)
  end

  # GET /equipment/1 or /equipment/1.json
  def show
  end

  # GET /equipment/new
  def new
    @equipment = Equipment.new(game_system: @game_system)
  end

  # GET /equipment/1/edit
  def edit
  end

  # POST /equipment or /equipment.json
  def create
    @equipment = Equipment.new(equipment_params)

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to game_systems_wargame_url(@equipment.game_system), notice: "Equipment was successfully created." }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1 or /equipment/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to game_systems_wargame_url(@equipment.game_system), notice: "Equipment was successfully updated." }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1 or /equipment/1.json
  def destroy
    @equipment.destroy!

    respond_to do |format|
      format.html { redirect_to equipment_index_url, notice: "Equipment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_game_system
    @game_system = GameSystem.find(params[:game_system_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def equipment_params
    params.require(:equipment).permit(:name, :description, :cost, :attach_to_list, :attach_to_unit, :game_system_id)
  end
end
