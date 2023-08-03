class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments
    has_many :replies

    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
end
