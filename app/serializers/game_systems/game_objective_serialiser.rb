module GameSystems
  class GameObjectiveSerialiser
    include Alba::Resource
    include Rails.application.routes.url_helpers

    attributes :id, :name, :created_at, :updated_at
  end
end
