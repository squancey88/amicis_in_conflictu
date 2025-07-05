class LocationTypesController < ApplicationController
  include WithinWorld

  before_action :set_record, only: %i[show edit update destroy]
  before_action :set_records, only: %i[index]

  def index
    render "within_world/index"
  end

  def new
    @location_type = new_record
    render "within_world/show_edit"
  end

  def show
    render "within_world/show_edit"
  end

  def edit
    redirect_to id: @location_type.id, action: :show
  end

  def create
    @location_type = new_record(location_type_params)

    respond_to do |format|
      if @location_type.save
        format.html {
          redirect_to world_location_type_path(@world, @location_type), notice: "Location type was successfully created."
        }
      else
        format.html { render "within_world/show_edit", status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @location_type.update(location_type_params)
        format.html {
          redirect_to world_location_type_path(@world, @location_type), notice: "Location type was successfully updated."
        }
      else
        format.html {
          render "within_world/show_edit", status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @location_type.destroy!

    respond_to do |format|
      format.html { redirect_to root_url, notice: "#{@location_type.class.model_name.human} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_records
    @pagy, @location_types = pagy(@world.location_types)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_record
    @location_type = LocationType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def location_type_params
    params.require(:location_type).permit(:name, :world_id)
  end
end
