class Post < ApplicationRecord
  belongs_to :board
  belongs_to :user
  has_many :comments
  # acts_as_paranoid

  has_many :favorite_posts
  has_many :favorite_users, through: :favorite_posts, source: 'user'

  validates :title, presence: true
  validates :content, presence: true

  def owned_by?(user)
    self.user == user
  end
end
