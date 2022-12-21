class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    # @book = Book.find(@book.id)
    @book.user_id = current_user.id

    @book.save
    redirect_to book_path(@book)

      # redirect_to users_path

  end
  def index
     @book = Book.new
  end

  def show
     @book = Book.new
  end

  def edit
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
