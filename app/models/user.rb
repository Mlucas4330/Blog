class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  devise :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :posts
  has_many :comments
  has_many :replies

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
