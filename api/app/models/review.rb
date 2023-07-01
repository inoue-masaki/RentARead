class Review < ApplicationRecord
  belongs_to :book

  validates :title, presence: true, length: { maximum: 30 }
  validates :desc, presence: true, length: { maximum: 280 }
  validates :book_id, presence: true
  validates :user_id, presence: true

  def self.add_user_name(reviews)
    @comments = []
    reviews.each do |review|
      comment = review
      user = User.find(review.user_id)
      comment[:user_name] = user.name
      @comments << comment
    end
    return @comments
  end
end
