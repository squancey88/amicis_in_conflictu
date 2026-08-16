class ArmyListsPresenter < IndexPresenter
  def title
    "Army Lists"
  end

  def new_path
    new_army_list_path
  end

  def new_label
    "New Army List"
  end
end
