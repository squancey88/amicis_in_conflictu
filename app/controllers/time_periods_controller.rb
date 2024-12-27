class TimePeriodsController < ApplicationController
  include WithinWorld

  before_action :set_time_period, only: %i[show edit update destroy]

  # GET /time_periods or /time_periods.json
  def index
    @time_periods = @world.time_periods.order(:order)
  end

  # GET /time_periods/1 or /time_periods/1.json
  def show
  end

  # GET /time_periods/1/edit
  def edit
  end

  # POST /time_periods or /time_periods.json
  def create
    @time_period = new_record(time_period_params)

    respond_to do |format|
      if @time_period.save
        format.html { redirect_to time_period_url(@time_period), notice: "Time period was successfully created." }
        format.json { render :show, status: :created, location: @time_period }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_periods/1 or /time_periods/1.json
  def update
    respond_to do |format|
      if @time_period.update(time_period_params)
        format.html { redirect_to time_period_url(@time_period), notice: "Time period was successfully updated." }
        format.json { render :show, status: :ok, location: @time_period }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_periods/1 or /time_periods/1.json
  def destroy
    @time_period.destroy!

    respond_to do |format|
      format.html { redirect_to time_periods_url, notice: "Time period was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_time_period
    @time_period = TimePeriod.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def time_period_params
    params.require(:time_period).permit(:order, :world_id, :name, :description)
  end
end
