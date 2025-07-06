module WithinWorld
  extend ActiveSupport::Concern

  included do
    prepend_before_action :process_world
    before_action :new_record, only: %i[new] # standard:disable Rails/LexicallyScopedActionFilter
    before_action :check_access, only: %i[edit update destroy] # standard:disable Rails/LexicallyScopedActionFilter
    class_attribute :non_owner_actions, default: {}
  end

  class_methods do
    def allow_non_owner(*actions, check: nil, require_world: true)
      actions.each do |action|
        non_owner_actions[action.to_sym] = {
          check:, require_world:
        }
      end
    end
  end

  def check_access
    record = get_record
    redirect_to record.world, notice: "No access" unless record.world.owner == current_user
  end

  def process_world
    set_world
    if !@is_world_owner && non_owner_actions.has_key?(action_name.to_sym)
      action_details = non_owner_actions[action_name.to_sym]
      if action_details[:require_world] && @world.nil?
        redirect_to worlds_url
      end

      redirect_to worlds_url if action_details[:check] && !send(action_details[:check])
    end
  end

  def set_world
    @world = World.find(world_id)
    @world_building = current_user == @world.owner
    @is_world_owner = current_user == @world.owner
  end

  private

  def world_id
    params[:world_id]
  end

  def new_record(values = {})
    instance_variable_set(:"@#{controller_name.singularize}", controller_name.classify.constantize.new(world: @world, **values))
  end

  def set_records
    @pagy, records = pagy(@world.send(controller_name))
    instance_variable_set(:"@#{controller_name}", records)
  end

  def get_record
    controller_name.classify.constantize.includes(world: :owner).find(params[:id])
  end
end
