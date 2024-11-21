# frozen_string_literal: true

class PlayerNotesComponent < TextEditorComponent
  def initialize(current_player:, player_form:, player_index:)
    super(form: player_form, attribute: :notes)
    @current_player = current_player
    @player_index = player_index
  end
end
