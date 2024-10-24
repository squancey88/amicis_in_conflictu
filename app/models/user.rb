class User < ApplicationRecord
  include ActiveModel::SecurePassword

  has_secure_password :password_migration

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :registerable,
  devise :database_authenticatable

  has_many :user_group_memberships, dependent: :destroy
  has_many :gaming_groups, through: :user_group_memberships
  has_many :players, as: :controller, dependent: :destroy
  has_many :armies, dependent: :destroy
  has_many :army_lists, through: :armies
  belongs_to :invited_by, class_name: :User, dependent: nil, optional: true
  has_many :invities, class_name: :User, foreign_key: :invited_by_id, dependent: :nullify, inverse_of: :invited_by

  has_many :user_players, foreign_key: "controller_id", inverse_of: :user, dependent: nil

  validates :email, presence: true

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
    was_invited? && invitation_accepted_at.nil?
  end

  def was_invited?
    invitation_created_at.present?
  end

  def complete_invite(password)
    self.invitation_token = nil
    update_password(password)
  end

  def reset_password(password)
    self.reset_password_token = nil
    self.reset_password_sent_at = nil
    update_password(password)
  end

  def update_password(password)
    self.password_migration = password
    save!
  end

  def migrate_to_secure_password(password)
    if password_migration_digest.nil?
      self.password_migration = password
      save!
    end
  end
end
