class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :replies, dependent: :destroy, through: :comments
    
    validates :title, presence: true
    validates :body, presence: true
    validates :user_id, presence: true
end
