class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :registerable,
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :user_group_memberships, dependent: :destroy
  has_many :gaming_groups, through: :user_group_memberships
  has_many :players, as: :controller, dependent: :destroy
  has_many :armies, dependent: :destroy
  has_many :army_lists, through: :armies

  has_many :user_players, foreign_key: "controller_id", inverse_of: :user, dependent: nil

  def fullname
    if firstname || surname
      [firstname, surname].join(" ")
    else
      email
    end
  end

  def display_name
    nickname || fullname
  end

  def pending_invite?
    created_by_invite? && invitation_accepted_at.nil?
  end
end
