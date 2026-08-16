module Worlds
  class CharacterSerializer < BaseResource
    include Rails.application.routes.url_helpers

    attributes :given_name, :family_name, :physical_description_plain_text, :history_plain_text, :full_name

    attribute :species do |r|
      r.species.name
    end
    attribute :type do |r|
      r.character_type.name
    end
    attribute :custom_fields do |r|
      r.custom_fields_with_labels
    end

    attribute :edit_path do |resource|
      edit_world_character_path(resource.world, resource)
    end
    attribute :show_path do |resource|
      world_character_path(resource.world, resource)
    end
  end
end
