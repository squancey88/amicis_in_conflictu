class TimePeriodsPresenter < IndexPresenter
  def initialize(view_context, world)
    super(view_context)
    @world = world
  end

  def title
    "Time Periods"
  end

  def new_path
    new_world_time_period_path(world)
  end

  def new_label
    "New Time Period"
  end

  private

  attr_accessor :world
end
