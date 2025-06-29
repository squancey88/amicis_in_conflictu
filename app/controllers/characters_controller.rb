class CharactersController < ApplicationController
  include WithinWorld

  before_action :set_character, only: %i[show edit update destroy]
  exempt_world_check :my
  allow_non_owner :new, :create
  allow_non_owner :destroy, :update, check: :is_owner, require_world: false

  # GET /characters or /characters.json
  def index
    @characters = @world.characters
    @allow_creation = true
    @title = "Characters"
  end

  def my
    @characters = current_user.characters
    @allow_creation = false
    @title = "My Characters"
    render :index
  end

  # GET /characters/1 or /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character.campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id]
  end

  # GET /characters/1/edit
  def edit
    @world = @character.world if @world.nil?
  end

  # POST /characters or /characters.json
  def create
    @character = new_record(character_params)

    if @world.owner != current_user
      @character.character_type = @world.player_type
      @character.controlled_by = current_user
    end

    respond_to do |format|
      if @character.save
        format.html { redirect_to character_url(@character), notice: "Character was successfully created." }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to character_url(@character), notice: "Character was successfully updated." }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character.destroy!

    respond_to do |format|
      format.html {
        if @is_world_owner
          redirect_to characters_url, notice: "Character was successfully destroyed."
        else
          redirect_to my_characters_url, notice: "Character was successfully destroyed."
        end
      }
      format.json { head :no_content }
    end
  end

  private

  def check_access
    set_character
    if @character.controlled_by
      redirect_to @character.world, notice: "Only owner can edit character" unless is_owner
    else
      super
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  def is_owner
    set_character
    @character.controlled_by == current_user
  end

  # Only allow a list of trusted parameters through.
  def character_params
    params.require(:character).permit(:given_name, :family_name,
      :physical_description, :character_type_id,
      :history,
      :character_species_type_id, :born_during_id,
      :campaign_id, config: {})
  end
end
