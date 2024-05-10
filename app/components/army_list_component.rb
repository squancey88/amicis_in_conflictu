# frozen_string_literal: true

class ArmyListComponent < ViewComponent::Base
  def initialize(army:)
    @army = army
  end
end
