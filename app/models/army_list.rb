class ArmyList < ApplicationRecord
  belongs_to :army, optional: true
  belongs_to :user
  belongs_to :game_system
  belongs_to :campaign, optional: true

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
    units.sum(:cost)
  end

  def remaining_cost
    starting_cost - list_cost
  end
end
