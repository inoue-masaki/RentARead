class Api::V1::BooksController < ApplicationController
    # include UserSessionizeService
    # rescue_from JWT::InvalidJtiError, with: :invalid_jti

    # before_action :sessionize_user, only: [:create, :show_books, :lending]

    def index
        books = Book.all
        @render_book = Book.add_star(books)
        render json: @render_book
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            render json: @book
        else
            render json: @book.errors,status: 422
        end
    end

    def main
        books = Book.all
        add_star_books = Book.add_star(books)
        add_favarite_books = Book.add_favarite(add_star_books, params[:id])
        render json: add_favarite_books
    end

    def show
        books = Book.where(kind: params[:kind])
        @render_book = Book.add_star(books)
        render json: @render_book
    end

    def show_id
        books = Book.where(kind: params[:kind])
        add_star_books = Book.add_star(books)
        @render_book = Book.add_favarite(add_star_books, params[:id])
        render json: @render_book
    end

    def detail
        @book = Book.find(params[:id])

        reviews = Review.where(book_id: @book.id)
        @star_count = 0
        @stars = 0

        reviews.each do |r|
            @star_count += 1
            @stars += r.star
        end

        if @stars != 0
          avg_star = @stars / @star_count
          @book['avg_star'] = avg_star
          @book['star_count'] = @star_count
        else
          @book['star_count'] = 0
        end

        render json: @book
    end

    def lend_books
        book = Book.where(lender: params[:id])
        render json: book
    end

    def favorite
        books = Book.all
        add_star_books = Book.add_star(books)
        add_favarite_books = Book.add_favorite(add_star_books, params[:id])
        render json: add_favarite_books
    end

    def show_books
        book = Book.where(borrower: params[:id])
        render json: book
    end

    def lending
        book = Book.find(params[:id])
        book.update_attribute(:borrower, params[:lending])
        render json: book
    end

    def return
        book = Book.find(params[:id])
        book.update_attribute(:borrower, nil)
        render json: book
    end

    def search
        books = Book.search(params[:keyword])
        @render_book = Book.add_star(books)
        render json: @render_book
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy!
        render json: book
    end

    private

    def book_params
        params.require(:book).permit(
            :title,
            :publisher,
            :author,
            :kind,
            :desc,
            :lender,
            :borrower,
            :lending,
            :fabarite,
            :image
        )
    end
end
