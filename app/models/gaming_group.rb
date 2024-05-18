class GamingGroup < ApplicationRecord
  has_many :user_group_memberships, dependent: :destroy
  has_many :users, through: :user_group_memberships
  has_many :teams, dependent: :destroy
  has_many :gaming_sessions, dependent: :destroy

  validates :name, presence: true

  def is_user?(user)
    users.find_by(id: user.id).present?
  end

  def owners
    users.joins(:user_group_memberships).where(user_group_memberships: {owner: true})
  end

  def members
    users.joins(:user_group_memberships).where(user_group_memberships: {owner: false})
  end

  def is_owner?(user)
    users.joins(:user_group_memberships).where(user_group_memberships: {owner: true, user:}).any?
  end

  def results_by_team
    results = gaming_sessions.joins(games: {players: [:team]})
      .group("teams.id", "players.result").count
    data = results.group_by { |k, v| k[0] }
    teams.map { flatten_results(_1, data) }
  end

  def results_by_player
    # user, wins, draws, losses
    results = gaming_sessions.joins(games: {players: [:user]})
      .group("users.id", "players.result").count
    data = results.group_by { |k, v| k[0] }
    users.map { flatten_results(_1, data) }
  end

  private

  def flatten_results(model, data)
    row = [model, 0, 0, 0]
    if data.has_key?(model.id)
      model_results = data[model.id]
      model_results.each do |vk, vv|
        case (vk[1])
        when "won"
          row[1] = vv
        when "draw"
          row[2] = vv
        when "lost"
          row[3] = vv
        end
      end
    end
    row
  end
end
