class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_posts
    self.posts.sort_by { |post| post.created_at }.first(5)
  end

  def featured_post
    self.posts.max_by { |post| post.likes }
  end

  def blogger_average_age
    bloggers = self.bloggers.uniq
    bloggers.map(&:age).sum / bloggers.size
  end
end
