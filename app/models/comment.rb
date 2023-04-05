class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_save :comment_counter

  after_save :update_comments_counter

  private

  def comment_counter
    post.increment!(:comments_counter)
  end
  
  def update_comments_counter
    post.update(comments_counter: post.comments.all.length)
  end
end
