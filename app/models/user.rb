class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :registerable,
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :user_group_memberships, dependent: :destroy
  has_many :gaming_groups, through: :user_group_memberships
end
