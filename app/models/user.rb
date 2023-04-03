class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy
  validates :name, presence: true
  validates :post_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
