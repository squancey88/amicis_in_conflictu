class OrganisationsController < ApplicationController
  include WithinWorld

  before_action :set_organisation, only: %i[show edit update destroy]
  before_action :set_records, only: %i[index]

  # GET /organisations or /organisations.json
  def index
  end

  # GET /organisations/1 or /organisations/1.json
  def show
  end

  # GET /organisations/new
  def new
  end

  # GET /organisations/1/edit
  def edit
  end

  # POST /organisations or /organisations.json
  def create
    @organisation = new_record(organisation_params)

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to world_organisation_url(@world, @organisation), notice: "Organisation was successfully created." }
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organisations/1 or /organisations/1.json
  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to world_organisation_url(@world, @organisation), notice: "Organisation was successfully updated." }
        format.json { render :show, status: :ok, location: @organisation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1 or /organisations/1.json
  def destroy
    @organisation.destroy!

    respond_to do |format|
      format.html { redirect_to world_url(@world), notice: "Organisation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def organisation_params
    params.require(:organisation).permit(:name, :organisation_type_id, :world_owner_notes)
  end
end
