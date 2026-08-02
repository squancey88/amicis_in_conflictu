class GameSystemSerializer
  include Alba::Resource

  attributes :id, :name, :created_at, :updated_at, :type, :competitive, :slug, :edition, :scoring_keys
end
