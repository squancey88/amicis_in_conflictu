class QuestPresenter < ShowPresenter
  def index_title
    "Quests"
  end

  private

  def edit_path
    edit_world_quest_path(record.world, record)
  end

  def record_path
    world_quest_path(record.world, record)
  end

  def can_delete?
    true
  end
end
