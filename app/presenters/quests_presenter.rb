class QuestsPresenter < IndexPresenter
  def initialize(view_context, world)
    super(view_context)
    @world = world
  end

  def title
    "Quests"
  end

  def new_path
    new_world_quest_path(world)
  end

  def new_label
    "New Quest"
  end

  private

  attr_accessor :world
end
