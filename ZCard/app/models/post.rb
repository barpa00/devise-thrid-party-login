class Post < ApplicationRecord
  belongs_to :board
  belongs_to :user

  has_many :comments
  validates :title, presence: true
  validates :content, presence: true

  def owned_by?(user)
    # <% if @post.user == current_user %> 
    self.user == user
  end
end
