class UsersController < ApplicationController
  def new

  end

  def index
    @book = Book.new
  end

  def show
    @book = Book.new
  end

  def edit
    # @user = User.find(params[:id])
  end
  
   # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
