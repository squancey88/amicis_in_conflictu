module IsGameSystem
  extend ActiveSupport::Concern

  included do
    before_action :verify_admin
    before_action :process_config_string, only: [:create, :update]
    before_action :set_record, only: [:show, :edit]
  end

  class_methods do
  end

  def show
  end

  def new
    @record = game_system_class.new
    instance_variable_set(:"@#{controller_name.singularize}", @record)
    render "game_systems/#{controller_name}/form"
  end

  def edit
    render "game_systems/#{controller_name}/form"
  end

  def create
    record = game_system_class.new(game_system_params)
    instance_variable_set(:"@#{controller_name.singularize}", record)
    respond_to do |format|
      if record.save
        format.html { redirect_to record, notice: "Game system was successfully created." }
        format.json { render :show, status: :created, location: record }
      else
        format.html { render "game_systems/#{controller_name}/form", status: :unprocessable_entity }
        format.json { render json: record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    record = game_system_class.find(params[:id])
    instance_variable_set(:"@#{controller_name.singularize}", record)
    respond_to do |format|
      if record.update(game_system_params)
        format.html { redirect_to record, notice: "Game system was successfully updated." }
        format.json { render :show, status: :ok, location: record }
      else
        format.html { render "game_systems/#{controller_name}/form", status: :unprocessable_entity }
        format.json { render json: record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @record = game_system_class.find(params[:id])
    @record.destroy!

    respond_to do |format|
      format.html { redirect_to game_systems_url, notice: "Game system was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def process_config_string
    param_name = "game_systems_#{controller_name.singularize}"
    if params[param_name]["game_config_json_string"]
      params[param_name]["game_config"] = JSON.parse(params[param_name]["game_config_json_string"])
    end
  end

  def game_system_class
    "GameSystems::#{controller_name.classify}".constantize
  end

  def game_system_params
    raise NotImplementedError
  end

  def set_record
    instance_variable_set(:"@#{controller_name.singularize}",
      game_system_class.find(params[:id]))
  end
end
