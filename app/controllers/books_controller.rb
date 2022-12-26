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
     @books = Book.all
    # @user = current_user
  end

  def show
     @book = Book.new
     @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    Book.update(book_params)
    redirect_to books_path(@book.id)
  end

  private

  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
