class GameSystemSerializer
  include Alba::Resource

  attributes :id, :name, :created_at, :updated_at, :type, :competitive, :slug, :edition

  attributes :scoring_keys, :scoring_values, if: proc { |resource| resource.respond_to?(:scoring_keys) }
end
