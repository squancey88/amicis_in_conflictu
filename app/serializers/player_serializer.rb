class PlayerSerializer
  include Alba::Resource

  attributes :id, :created_at, :updated_at, :display_name, :turns

  attribute :type, &:controller_type

  many :turn_objectives
end
