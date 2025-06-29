class ArmyList < ApplicationRecord
  belongs_to :army, optional: true
  belongs_to :user
  belongs_to :game_system
  belongs_to :campaign, optional: true
  has_many :equipment_attachments, dependent: :destroy, foreign_key: "attached_to_id", inverse_of: :attached_to
  has_many :equipment, through: :equipment_attachments

  has_many :player_armies, dependent: :destroy
  has_many :players, through: :player_armies

  has_many :units, dependent: :destroy

  before_create :set_initial_values

  validates :name, presence: true

  def set_initial_values
    if campaign
      self.initial_values = campaign.config
      self.starting_cost = campaign.list_start_cost
    end
  end

  def list_cost
    units.sum(:cost) + equipment.sum(:cost)
  end

  def calc_game_gains
    gains = {
      "list_cost_change" => 0
    }
    initial_values&.each do |key, value|
      gains[key] = value.to_i
    end
    players.each do |player|
      if player.game_data.has_key?("campaign")
        campaign_data = player.game_data["campaign"]
        campaign_data["changes"].each do |key, value|
          gains[key] += value.to_i
        end
      end
    end
    gains
  end

  def game_gains
    return calc_game_gains if campaign
    {}
  end

  def remaining_cost
    if starting_cost
      cost = starting_cost - list_cost
      cost += game_gains["list_cost_change"] if campaign
      cost
    else
      0
    end
  end

  def to_s = name
end

# == Schema Information
#
# Table name: army_lists
#
#  id             :uuid             not null, primary key
#  cost           :integer
#  details        :jsonb
#  initial_values :jsonb
#  name           :string
#  starting_cost  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  army_id        :uuid
#  campaign_id    :uuid
#  game_system_id :uuid             not null
#  user_id        :uuid             not null
#
# Indexes
#
#  index_army_lists_on_army_id         (army_id)
#  index_army_lists_on_campaign_id     (campaign_id)
#  index_army_lists_on_game_system_id  (game_system_id)
#  index_army_lists_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (army_id => armies.id)
#  fk_rails_...  (game_system_id => game_systems.id)
#  fk_rails_...  (user_id => users.id)
#
