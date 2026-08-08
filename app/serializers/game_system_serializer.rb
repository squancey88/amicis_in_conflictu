class GameSystemSerializer
  include Alba::Resource

  attributes :id, :name, :created_at, :updated_at, :type, :competitive, :slug, :edition

  attributes :scoring_values, if: proc { |resource| resource.respond_to?(:scoring_values) }

  trait :with_objectives do
    many :game_objectives
  end
end
