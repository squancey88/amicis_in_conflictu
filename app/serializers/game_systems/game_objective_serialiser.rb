module GameSystems
  class GameObjectiveSerialiser
    include Alba::Resource
    include Rails.application.routes.url_helpers

    attributes :id, :name, :scoring_key, :created_at, :updated_at

    attribute :edit_path do |resource|
      edit_game_objective_path(resource)
    end
    attribute :show_path do |resource|
      game_objective_path(resource)
    end
  end
end
