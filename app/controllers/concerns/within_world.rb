module WithinWorld
  extend ActiveSupport::Concern

  included do
    prepend_before_action :process_world
    before_action :new_record, only: %i[new] # standard:disable Rails/LexicallyScopedActionFilter
    before_action :check_access, only: %i[edit update destroy] # standard:disable Rails/LexicallyScopedActionFilter
    class_attribute :non_owner_actions, default: {}
  end

  class_methods do
    def allow_non_owner(*actions, check: nil)
      actions.each do |action|
        non_owner_actions[action.to_sym] = {
          check:
        }
      end
    end
  end

  def check_access
    record = get_record
    redirect_to record.world, notice: "No access" unless record.can_edit?(current_user)
  end

  def process_world
    set_world
    unless @is_world_owner
      if non_owner_actions.has_key?(action_name.to_sym)
        action_details = non_owner_actions[action_name.to_sym]

        redirect_to worlds_url if action_details[:check] && !send(action_details[:check])
      end
    end
  end

  private

  def set_world
    @world = World.find(params[:world_id])
    @world_building = current_user == @world.owner
    @is_world_owner = current_user == @world.owner
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
