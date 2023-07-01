class Book < ApplicationRecord
  extend CarrierWave::Mount
  has_many :reviews
  has_many :favarites
  has_many :users, through: :favarites
  attr_accessor :image
  include Rails.application.routes.url_helpers
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 100 }
  validates :author, length: { maximum: 50 }
  validates :publisher, length: { maximum: 30 }
  validates :kind, presence: true
  validates :desc, length: { maximum: 800 }

  def image_url
    image.attached? ? url_for(image) : nil
  end

  def self.search(keyword)
    where(["title like? OR author like?","%#{keyword}%","%#{keyword}%"])
  end

  def self.add_star(books)
    @render_book = []
    books.each do |book|
      new_book = book
      reviews = Review.where(book_id: new_book.id)
      @star_count = 0
      @stars = 0

      reviews.each do |r|
          @star_count += 1
          @stars += r.star
      end

      if @stars != 0
        avg_star = @stars / @star_count
        new_book['avg_star'] = avg_star
        new_book['star_count'] = @star_count
        @render_book << new_book
      else
        new_book['star_count'] = 0
        @render_book << new_book
      end

    end
    return @render_book
  end

  def self.add_favarite(add_star_books, id)
    @render_book = []
    @add_star_books = add_star_books
    @id = id

    @add_star_books.each do |add_star_book|
      @book = add_star_book
      @users = add_star_book.users
      @users.each do |add_star_book_user|
        if add_star_book_user.id == @id.to_i
          @book['favarite'] = true
          break
        end
      end
      if @book['favarite'] != true
        @book['favarite'] = false
      end
      @render_book << @book
    end

    return @render_book
  end

  def self.add_favorite(add_star_books, id)
    @render_book = []
    @add_star_books = add_star_books
    @id = id

    @add_star_books.each do |add_star_book|
      @book = add_star_book
      @users = add_star_book.users
      @users.each do |add_star_book_user|
        if add_star_book_user.id == @id.to_i
          @book['favarite'] = true
          @render_book << @book
          break
        end
      end
      if @book['favarite'] != true
        @book['favarite'] = false
      end
    end

    return @render_book
  end

end