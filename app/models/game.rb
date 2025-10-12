class Game < ApplicationRecord
  belongs_to :gaming_session, dependent: nil
  belongs_to :game_system, dependent: nil
  belongs_to :campaign, dependent: nil, optional: true
  has_one :gaming_group, through: :gaming_session

  has_many :players, dependent: :destroy
  has_many :unit_xp_gain_applied, dependent: :destroy
  has_many :unit_applied_modifier, dependent: :destroy
  has_many :game_quest_events, dependent: :destroy

  enum game_state: {not_played: 0, in_progress: 3, finished: 2, cancelled: 1}

  validates :players, presence: true

  accepts_nested_attributes_for :players
  accepts_nested_attributes_for :unit_xp_gain_applied
  accepts_nested_attributes_for :unit_applied_modifier
  accepts_nested_attributes_for :game_quest_events

  before_create :setup_data
  after_save :check_finished

  def title
    return "#{campaign.name} (Session: #{campaign_session_number})" if campaign
    game_system.name
  end

  def set_initial_data(**start_values)
    @initial_data = start_values
  end

  def campaign_session_number
    all_sessions = Game.joins(gaming_session: :gaming_group).where({campaign:, gaming_session: {gaming_group: gaming_session.gaming_group}}).order(:created_at)
    all_sessions.find_index(self) + 1
  end

  def setup_data
    game_data = game_system.setup_game_data
    game_data.merge!(@initial_data) if @initial_data
    self.data = game_data
  end

  def check_finished
    if finished?
      set_winners
    else
      players.each { |p| p.update_column(:result, :not_set) }
    end
  end

  def editable?
    finished? || cancelled?
  end

  def winners
    players.where(result: :won)
  end

  def set_winners
    game_system.set_winners(self)
  end
end

# == Schema Information
#
# Table name: games
#
#  id                :uuid             not null, primary key
#  data              :jsonb
#  finish_reason     :string
#  game_state        :integer          default("not_played")
#  notes             :jsonb
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  campaign_id       :uuid
#  game_system_id    :uuid             not null
#  gaming_session_id :uuid             not null
#
# Indexes
#
#  index_games_on_campaign_id        (campaign_id)
#  index_games_on_game_system_id     (game_system_id)
#  index_games_on_gaming_session_id  (gaming_session_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_system_id => game_systems.id)
#  fk_rails_...  (gaming_session_id => gaming_sessions.id)
#
