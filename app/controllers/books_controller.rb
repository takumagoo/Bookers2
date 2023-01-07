class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def create
    @book = Book.new(book_params)
    # @book = Book.find(@book.id)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
      # redirect_to users_path
    else
      @books = Book.all
      render :index
    end
  end
  def index
     @book = Book.new
     @books = Book.all
    # @book.user_id = current_user.id
    # @book_id= Book.find(params[:id])
    # @user = @book_id.user
    # @user = current_user
  end

  def show
     @new_book = Book.new
     @book = Book.find(params[:id])
     @user = @book.user
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
    if @book.update(book_params)
      flash[:notice] = "You have update book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private

  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to books_path
    end
  end
end
