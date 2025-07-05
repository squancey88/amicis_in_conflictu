class CharacterTypesController < ApplicationController
  include WithinWorld
  include HasJsonSchema

  has_json_config :config

  before_action :set_record, only: %i[show edit update destroy]
  before_action :set_records, only: %i[index]

  def index
    render "within_world/index"
  end

  def new
    @character_type = new_record
    render "within_world/show_edit"
  end

  def show
    render "within_world/show_edit"
  end

  def edit
    redirect_to world_character_type_path(@character_type.world, @character_type)
  end

  def create
    @character_type = new_record(record_params)

    respond_to do |format|
      if @character_type.save
        format.html {
          redirect_to world_character_type_path(@character_type.world, @character_type), notice: "Character type was successfully created."
        }
      else
        format.html { render "within_world/show_edit", status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @character_type.update(record_params)
        format.html {
          redirect_to world_character_type_path(@character_type.world, @character_type), notice: "Character type was successfully updated."
        }
      else
        format.html {
          render "within_world/show_edit", status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @character_type.destroy!

    respond_to do |format|
      format.html { redirect_to root_url, notice: "#{@character_type.class.model_name.human} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_record
    @character_type = CharacterType.find(params[:id])
  end

  def set_records
    @pagy, @character_types = pagy(@world.character_types.where.not(name: "Player"))
  end

  def record_params
    params.require(:character_type).permit(:name, config: {})
  end
end
