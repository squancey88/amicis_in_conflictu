class OrganisationTypesController < ApplicationController
  include WithinWorld
  include HasJsonSchema

  has_json_config :config

  before_action :set_record, only: %i[show edit update destroy]
  before_action :set_records, only: %i[index]

  def index
    render "within_world/index"
  end

  def new
    @organisation_type = new_record
    render "within_world/show_edit"
  end

  def show
    render "within_world/show_edit"
  end

  def edit
    redirect_to world_organisation_type_path(@organisation_type.world, @organisation_type)
  end

  def create
    @organisation_type = new_record(record_params)

    respond_to do |format|
      if @organisation_type.save
        format.html {
          redirect_to world_organisation_type_path(@organisation_type.world, @organisation_type), notice: "Organisation type was successfully created."
        }
      else
        format.html { render "within_world/show_edit", status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @organisation_type.update(record_params)
        format.html {
          redirect_to world_organisation_type_path(@organisation_type.world, @organisation_type), notice: "Organisation type was successfully updated."
        }
      else
        format.html {
          render "within_world/show_edit", status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @organisation_type.destroy!

    respond_to do |format|
      format.html { redirect_to root_url, notice: "#{@organisation_type.class.model_name.human} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_record
    @organisation_type = OrganisationType.find(params[:id])
  end

  def set_records
    @pagy, @organisation_types = pagy(@world.organisation_types.where.not(name: "Player"))
  end

  def record_params
    params.require(:organisation_type).permit(:name, config: {})
  end
end
