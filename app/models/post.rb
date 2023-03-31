class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user

  def latest_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_posts_counter

  private

  def post_counter
    author.increment!(:posts_counter)
  end
end
