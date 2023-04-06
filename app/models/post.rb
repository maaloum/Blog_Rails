class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, :likes_counter, comparison: { greater_than_or_equal_to: 0 },
                                               numericality: { only_integer: true }

  def latest_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_posts_counter
  def recent_five
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
