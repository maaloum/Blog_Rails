class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post


  after_save :like_counter

  after_save :update_likes_counter

  def update_likes_counter; end

  private

  def like_counter
    post.increment!(:likes_counter)
  end
end
