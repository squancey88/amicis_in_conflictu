class TurnObjectiveSerializer
  include Alba::Resource

  attributes :id, :created_at, :updated_at, :turn, :points_scored

  one :game_objective
end
