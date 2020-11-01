class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true, uniqueness: true
  validates :bio, length: { minimum: 30 }
  validates :age, numericality: { greater_than: 0 }

  def total_likes
    self.posts.map(&:likes).sum
  end

  def featured_post
    self.posts.max_by { |post| post.likes }
  end

  def most_written_about
    dest_hash = {}
    self.destinations.each do |d|
      dest_hash[d] ? dest_hash[d] += 1 : dest_hash[d] = 1
    end
    dest_hash.sort_by { |dest, posts| posts }.reverse.first(5).flatten
  end
end
