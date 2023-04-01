class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, :likes_counter, comparison: { greater_than_or_equal_to: 0 },
                                               numericality: { only_integer: true }

  def latest_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_posts_counter

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
