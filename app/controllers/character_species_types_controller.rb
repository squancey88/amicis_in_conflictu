class CharacterSpeciesTypesController < ApplicationController
  include WithinWorld

  before_action :set_record, only: %i[show edit update destroy]
  before_action :set_records, only: %i[index]

  def index
    render "within_world/index"
  end

  def new
    @character_species_type = new_record
    render "within_world/show_edit"
  end

  def show
    render "within_world/show_edit"
  end

  def edit
    redirect_to world_id: @world.id, id: @character_species_type.id, action: :show
  end

  def create
    @character_species_type = new_record(character_species_type_params)

    respond_to do |format|
      if @character_species_type.save
        format.html {
          redirect_to world_character_species_type_path(@world, @character_species_type), notice: "Location type was successfully created."
        }
      else
        format.html { render "within_world/show_edit", status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @character_species_type.update(character_species_type_params)
        format.html {
          redirect_to world_character_species_type_path(@world, @character_species_type), notice: "Location type was successfully updated."
        }
      else
        format.html {
          render "within_world/show_edit", status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @character_species_type.destroy!

    respond_to do |format|
      format.html { redirect_to root_url, notice: "#{@character_species_type.class.model_name.human} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_record
    @character_species_type = CharacterSpeciesType.find(params[:id])
  end

  def set_records
    @pagy, @character_species_types = pagy(@world.character_species_types)
  end

  def character_species_type_params
    params.require(:character_species_type).permit(:name, :lifespan)
  end
end
