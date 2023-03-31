class Comment < ApplicationRecord
  belongs_to :user
  after_save :comment_counter

  after_save :update_comments_counter

  private

  def comment_counter
    post.increment!(:comments_counter)
  end
end
