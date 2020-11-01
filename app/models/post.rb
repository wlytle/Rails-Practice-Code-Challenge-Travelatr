class Post < ApplicationRecord
  belongs_to :destination
  belongs_to :blogger

  validates :content, length: { minimum: 100 }
  validates :title, presence: true

  def like
    self.likes += 1
    self.save
  end
end
