class User < ApplicationRecord
  devise :database_authenticatable, :jwt_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :replies

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
