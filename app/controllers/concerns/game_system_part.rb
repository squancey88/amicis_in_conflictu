module GameSystemPart
  extend ActiveSupport::Concern

  included do
    before_action :set_game_system, only: %i[index new] # standard:disable Rails/LexicallyScopedActionFilter
    before_action :set_records, only: %i[index] # standard:disable Rails/LexicallyScopedActionFilter
    before_action :new_record, only: %i[new] # standard:disable Rails/LexicallyScopedActionFilter
  end

  def set_records
    @pagy, records = pagy(@game_system.send(controller_name))
    instance_variable_set(:"@#{controller_name}", records)
  end

  def set_game_system
    @game_system = GameSystem.find(params[:game_system_id])
  end

  def new_record(values = {})
    instance_variable_set(:"@#{controller_name.singularize}",
      controller_name.classify.constantize.new(game_system: @game_system, **values))
  end
end
