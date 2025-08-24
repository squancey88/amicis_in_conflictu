class LocationsController < ApplicationController
  include WithinWorld

  before_action :set_location, only: %i[show edit update destroy]
  before_action :set_records, only: %i[index]

  # GET /locations or /locations.json
  def index
  end

  # GET /locations/1 or /locations/1.json
  def show
  end

  # GET /locations/new
  def new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations or /locations.json
  def create
    @location = new_record(location_params)
    @location.world = @world

    respond_to do |format|
      if @location.save
        format.html { redirect_to world_location_url(@world, @location), notice: "Location was successfully created." }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1 or /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to world_location_url(@world, @location), notice: "Location was successfully updated." }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1 or /locations/1.json
  def destroy
    @location.destroy!

    respond_to do |format|
      format.html { redirect_to world_url(@world), notice: "Location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @location = Location.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def location_params
    params.require(:location).permit(:name, :description, :history, :located_in_id, :location_type_id, :world_owner_notes)
  end
end
