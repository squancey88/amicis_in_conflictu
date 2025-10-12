class GameSerializer < BaseSerializer
  private

  def columns
    %i[game_state finish_reason data]
  end
end
