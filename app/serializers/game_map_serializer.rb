class GameMapSerializer
  include Alba::Resource

  attributes :id, :map_type, :name, :created_at, :updated_at, :config
end
