class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :replies, dependent: :destroy

  validates :body, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
end