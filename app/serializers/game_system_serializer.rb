class GameSystemSerializer < BaseSerializer
  private

  def columns
    %i[type competitive name slug edition]
  end
end
