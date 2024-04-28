class ArmiesController < ApplicationController
  before_action :set_army, only: %i[show edit update destroy]

  # GET /armies or /armies.json
  def index
    @armies = current_user.armies
  end

  # GET /armies/1 or /armies/1.json
  def show
  end

  # GET /armies/new
  def new
    @army = Army.new(user: current_user)
  end

  # GET /armies/1/edit
  def edit
  end

  # POST /armies or /armies.json
  def create
    @army = Army.new(army_params)

    respond_to do |format|
      if @army.save
        format.html { redirect_to army_url(@army), notice: "Army was successfully created." }
        format.json { render :show, status: :created, location: @army }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @army.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armies/1 or /armies/1.json
  def update
    respond_to do |format|
      if @army.update(army_params)
        format.html { redirect_to army_url(@army), notice: "Army was successfully updated." }
        format.json { render :show, status: :ok, location: @army }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @army.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armies/1 or /armies/1.json
  def destroy
    @army.destroy!

    respond_to do |format|
      format.html { redirect_to armies_url, notice: "Army was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_army
    @army = Army.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def army_params
    params.require(:army).permit(:name, :game_system_id, :user_id)
  end
end
