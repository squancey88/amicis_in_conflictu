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
    schema.add_string_property("Time Period Name", true)
    schema
  end
end
