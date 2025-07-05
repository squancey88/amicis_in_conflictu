class Character < ApplicationRecord
  include Rails.application.routes.url_helpers
  include WorldItem
  include WorldVisibility
  include TextLinkable
  include Activatable
  include HasTextSection

  register_link_search_fields :given_name, :family_name

  belongs_to :world
  belongs_to :born_during, class_name: :TimePeriod, optional: true
  belongs_to :character_type
  belongs_to :character_species_type
  alias_method :species, :character_species_type

  belongs_to :controlled_by, class_name: :User, optional: true
  belongs_to :campaign, optional: true

  validates :given_name, presence: true

  connect_world_items "WorldItemData::TextSection", :details

  register_text_section :physical_description
  register_text_section :history

  def full_name
    [given_name, family_name].join(" ")
  end

  def link_name = full_name

  def link_path = character_path(self)

  def to_s = full_name

  def self.character_config_schema
    schema = JsonSchema.new(title: "Characater Settings")
    schema.add_array_property("custom_fields", false, [
      {
        type: :object,
        properties: {
          name: {
            title: "Field Name",
            type: "string"
          },
          key: {
            title: "Key (must be unique)",
            type: "string",
            pattern: "[A-Za-z0-9_]+"
          },
          required: {
            title: "Required",
            type: "boolean",
            required: true,
            default: false
          },
          type: {
            type: "string",
            default: "string",
            enum: [
              "string",
              "integer",
              "boolean"
            ]
          }
        }
      }
    ], title: "Custom Fields")
    schema
  end
end

# == Schema Information
#
# Table name: characters
#
#  id                        :uuid             not null, primary key
#  active                    :boolean          default(TRUE)
#  config                    :jsonb
#  family_name               :string
#  given_name                :string
#  history                   :jsonb
#  physical_description      :jsonb
#  visibility                :integer          default("gm_only")
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  born_during_id            :uuid
#  campaign_id               :uuid
#  character_species_type_id :uuid             not null
#  character_type_id         :uuid             not null
#  controlled_by_id          :uuid
#  world_id                  :uuid             not null
#
# Indexes
#
#  index_characters_on_born_during_id             (born_during_id)
#  index_characters_on_campaign_id                (campaign_id)
#  index_characters_on_character_species_type_id  (character_species_type_id)
#  index_characters_on_character_type_id          (character_type_id)
#  index_characters_on_controlled_by_id           (controlled_by_id)
#  index_characters_on_world_id                   (world_id)
#
# Foreign Keys
#
#  fk_rails_...  (born_during_id => time_periods.id)
#  fk_rails_...  (character_species_type_id => character_species_types.id)
#  fk_rails_...  (character_type_id => character_types.id)
#  fk_rails_...  (controlled_by_id => users.id)
#  fk_rails_...  (world_id => worlds.id)
#
