class World < ApplicationRecord
  belongs_to :owner, class_name: :User

  has_many :time_periods, dependent: :destroy
  has_many :character_types, dependent: :destroy
  has_many :character_species_types, dependent: :destroy
  has_many :characters, dependent: :destroy

  has_many :articles, dependent: :destroy
  has_many :quests, dependent: :destroy

  validates :name, presence: true

  after_create :setup_player_type

  store_accessor :config, :time_period_config
  store_accessor :config, :character_config

  def player_type
    character_types.find_by(name: "Player")
  end

  def text_editor_link_search(query)
    records = characters.text_editor_link_search(query)
    records += articles.text_editor_link_search(query)
    records
  end

  def to_s = name

  def setup_player_type
    CharacterType.create(world: self, name: "Player")
  end

  def self.time_period_schema
    schema = JsonSchema.new
    schema.add_string_property("name", true, title: "Time Period Name")
    schema
  end
end

# == Schema Information
#
# Table name: worlds
#
#  id         :uuid             not null, primary key
#  blurb      :string
#  config     :jsonb
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :uuid             not null
#
# Indexes
#
#  index_worlds_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
